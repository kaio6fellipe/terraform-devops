"""
Script used to exclude stateless route53 records during
Terraform Destroy, records created by external-dns
"""

import sys
import boto3

client = boto3.client('route53')
raw_hosted_zones = client.list_hosted_zones()
external_dns_managed_record = []
stateless_dns_record = []

def enumerate_records():
    """Enumerate Route53 records based on hosted zones"""
    for zone in raw_hosted_zones["HostedZones"]:
        zone_id = zone["Id"]
        zone_records = client.list_resource_record_sets(HostedZoneId=str(zone_id))
        for record in zone_records["ResourceRecordSets"]:
            try:
                if ("external-dns" in str(record["ResourceRecords"][0]["Value"])
                        and str(record["Type"]) == "TXT"
                        and "cname" not in str(record["Name"])):
                    record["ZoneId"] = zone_id
                    external_dns_managed_record.append(record)
            except Exception:
                pass

    for managed_record in external_dns_managed_record:
        for record in zone_records["ResourceRecordSets"]:
            if managed_record["Name"] in record["Name"]:
                record["ZoneId"] = managed_record["ZoneId"]
                stateless_dns_record.append(record)

def delete_record(json_record):
    """Delete Route53 record"""
    zone_id = json_record["ZoneId"]
    json_payload = {
        'Changes': [
            {
                'Action': 'DELETE',
                'ResourceRecordSet': {
                    'Name': json_record["Name"],
                    'Type': json_record["Type"],
                }
            }
        ]
    }

    if "AliasTarget" in str(json_record):
        json_payload["Changes"][0]["ResourceRecordSet"]["AliasTarget"] = json_record["AliasTarget"]
    if "TTL" in str(json_record):
        json_payload["Changes"][0]["ResourceRecordSet"]["TTL"] = json_record["TTL"]
    if "ResourceRecords" in str(json_record):
        json_payload["Changes"][0]["ResourceRecordSet"]["ResourceRecords"] = json_record["ResourceRecords"]

    response = client.change_resource_record_sets(
        HostedZoneId=zone_id,
        ChangeBatch=json_payload
    )
    return response

if __name__ == "__main__":
    try:
        enumerate_records()
        for record in stateless_dns_record:
            delete_record(record)
    except Exception as ex:
        print(ex)
        sys.exit(0)
