#Tests not completed
import sys
import os
path = os.getcwd()
sys.path.insert(0, str(os.path.abspath(os.path.join(path, os.pardir))))
from remove_route53_stateless_resources import *

from unittest.mock import MagicMock
from testfixtures import LogCapture
from contextlib import redirect_stdout
import logging
import io

def test_enumerate_records_valid():
    raw_hosted_zones = {
        "HostedZones": [
            {
                "Id": "1234567890123",
                "Name": "example.com.",
                "CallerReference": "unique-id-1",
                "Config": {
                    "Comment": "",
                    "PrivateZone": False
                },
                "ResourceRecordSetCount": 4
            }
        ]
    }
    boto3.client = MagicMock(return_value=client)
    client.list_hosted_zones = MagicMock(return_value=raw_hosted_zones)

    zone_records = {
        "ResourceRecordSets": [
            {
                "Name": "record1.example.com",
                "Type": "A",
                "TTL": 300,
                "ResourceRecords": [
                    {
                        "Value": "10.0.0.1"
                    }
                ]
            },
            {
                "Name": "record2.example.com",
                "Type": "TXT",
                "TTL": 300,
                "ResourceRecords": [
                    {
                        "Value": "\"external-dns\""
                    }
                ]
            },
            {
                "Name": "record3.example.com",
                "Type": "CNAME",
                "TTL": 300,
                "ResourceRecords": [
                    {
                        "Value": "example.com"
                    }
                ]
            },
            {
                "Name": "record4.example.com",
                "Type": "TXT",
                "TTL": 300,
                "ResourceRecords": [
                    {
                        "Value": "\"external-dns\""
                    }
                ]
            }
        ]
    }
    client.list_resource_record_sets = MagicMock(return_value=zone_records)
    
    enumerate_records()

    assert len(external_dns_managed_record) == 1
    assert external_dns_managed_record[0]["Name"] == "record2.example.com"
    assert stateless_dns_record[0]["Name"] == "record1.example.com"

def test_enumerate_records_exception():
    raw_hosted_zones = {
        "HostedZones": [
            {
                "Id": "1234567890123",
                "Name": "example.com.",
                "CallerReference": "unique-id-1",
                "Config": {
                    "Comment": "",
                    "PrivateZone": False
                },
                "ResourceRecordSetCount": 4
            }
        ]
    }
    boto3.client = MagicMock(return_value=client)
    client.list_hosted_zones = MagicMock(return_value=raw_hosted_zones)

    zone_records = {
        "ResourceRecordSets": [
            {
                "Name": "record1.example.com",
                "Type": "A",
                "TTL": 300,
                "ResourceRecords": [
                    {
                        "Value": "10.0.0.1"
                    }
                ]
            },
            {
                "Name": "record2.example.com",
                "Type": "TXT",
                "TTL": 300,
                "ResourceRecords": [
                    {
                        "Value": "\"external-dns\""
                    }
                ]
            }
        ]
    }
    client.list_resource_record_sets = MagicMock(side_effect=Exception("Error occurred while listing resource record sets"))
    
    log_output = io.StringIO()
    with LogCapture(level=logging.ERROR) as logs:
        with redirect_stdout(log_output):
            enumerate_records()

    assert len(external_dns_managed_record) == 0
    assert len(stateless_dns_record) == 0
    assert log_output.getvalue() == "An error occurred while enumerating records: Error occurred while listing resource record sets\n"
    logs.check(("root", "ERROR", "An error occurred while enumerating records: Error occurred while listing resource record sets"))

def test_valid_delete_record():
    json_record = {
        "Name": "example.com",
        "Type": "A",
        "ZoneId": "1234567890123"
    }

    client.change_resource_record_sets = MagicMock(return_value={"ResponseMetadata":{"HTTPStatusCode":200}})

    response = delete_record(json_record)
    assert response['ResponseMetadata']['HTTPStatusCode'] == 200

def test_invalid_delete_record():
    json_record = {
        "Name": "invalid-example.com",
        "Type": "A",
        "ZoneId": "1234567890123"
    }

    client.change_resource_record_sets = MagicMock(side_effect=Exception("An error occurred while deleting record"))

    try:
        response = delete_record(json_record)
    except Exception as ex:
        assert type(ex).__name__ == 'Exception'
        assert str(ex) == "An error occurred while deleting record"

def test_alias_target_delete_record():
    json_record = {
        "Name": "example.com",
        "Type": "A",
        "AliasTarget": {
            "DNSName": "example.com",
            "EvaluateTargetHealth": False,
            "HostedZoneId": "1234567890123"
        },
        "ZoneId": "1234567890123"
    }

    client.change_resource_record_sets = MagicMock(return_value={"ResponseMetadata":{"HTTPStatusCode":200}})

    response = delete_record(json_record)
    assert response['ResponseMetadata']['HTTPStatusCode'] == 200
