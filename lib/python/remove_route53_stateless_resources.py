"""
Script used to exclude stateless route53 records during
Terraform Destroy, records created by external-dns
"""
import logging
import boto3

def connect_client():
    try:
        client = boto3.client('route53')
        logging.info("Connected to route53 client on AWS API")
        return client
    except Exception as ex: # pylint: disable=broad-exception-caught
        logging.error("Failed to connect with route53 on AWS API: %s", ex)
        return None

def get_hosted_zones(client):
    try:
        raw_hosted_zones = client.list_hosted_zones()
        logging.info("Hosted Zones extracted from Route53, %s", raw_hosted_zones)
        return raw_hosted_zones
    except Exception as ex:
        logging.error("Failed to get hosted Zones in Route53: %s", ex)

def enumerate_records(client):
    """Enumerate Route53 records based on hosted zones"""
    external_dns_managed_record = []
    stateless_dns_record = []
    try:
        raw_hosted_zones = get_hosted_zones(client)
        logging.info("Starting enumeration of Route53 records...")
        for zone in raw_hosted_zones["HostedZones"]:
            zone_id = zone["Id"]
            zone_records = client.list_resource_record_sets(HostedZoneId=str(zone_id))

            for dns_record in zone_records["ResourceRecordSets"]:
                try:
                    if dns_record["ResourceRecords"][0]["Value"] is None or dns_record["Type"] is None or dns_record["Name"] is None:
                        pass
                    elif ("external-dns" in str(dns_record["ResourceRecords"][0]["Value"])
                            and str(dns_record["Type"]) == "TXT"
                            and "cname" not in str(dns_record["Name"])):
                        dns_record["ZoneId"] = zone_id
                        external_dns_managed_record.append(dns_record)
                    else:
                        pass
                except Exception as ex_enumerate: # pylint: disable=broad-except
                    logging.error("Failed to generate external_dns_managed_record list: %s, dns_record not parsed: %s, external_dns_list: %s",
                        ex_enumerate, dns_record, external_dns_managed_record)

        for managed_record in external_dns_managed_record:
            for dns_record in zone_records["ResourceRecordSets"]:
                if managed_record["Name"] in dns_record["Name"]:
                    dns_record["ZoneId"] = managed_record["ZoneId"]
                    stateless_dns_record.append(dns_record)

        logging.info("Finished the enumeration of Route53 records... Stateless DNS Records: %s", stateless_dns_record)
        return stateless_dns_record
    except Exception as ex:
        logging.error("Failed to Enumerate Route53 records: %s", ex)

def delete_record(client, json_record):
    """Delete Route53 record"""
    try:
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
            json_payload["Changes"][0]["ResourceRecordSet"]["AliasTarget"] = json_record["AliasTarget"] # pylint: disable=line-too-long
        if "TTL" in str(json_record):
            json_payload["Changes"][0]["ResourceRecordSet"]["TTL"] = json_record["TTL"] # pylint: disable=line-too-long
        if "ResourceRecords" in str(json_record):
            json_payload["Changes"][0]["ResourceRecordSet"]["ResourceRecords"] = json_record["ResourceRecords"] # pylint: disable=line-too-long

        logging.info("DNS Record that will be deleted: %s", json_payload)
        response = client.change_resource_record_sets(
            HostedZoneId=zone_id,
            ChangeBatch=json_payload
        )
        logging.info("DNS Record deleted response: %s", response)
        return response
    except Exception as ex_delete_record: # pylint: disable=broad-exception-caught
        logging.error("Failed to delete DNS Record: %s, Exception: %s",
            str(json_record["Name"]), ex_delete_record)
        return None
