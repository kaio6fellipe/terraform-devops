"""
botocore used to catch specific excepctions
boto3 used to communicate with AWS API
"""
import logging
import botocore
import boto3

class EC2:
    """
    Class used to deal with EC2 related entities
    such as: Security Groups
    """
    def __init__(self, region):
        self.region = region
        self.client = None

    def client_connect(self):
        """
        Connects to AWS
        """
        try:
            self.client = boto3.client('ec2', region_name=self.region)
            logging.info("Connected to AWS API with ec2 on region: %s", self.region)
            return self.client
        except botocore.exceptions.ClientError as ex:
            logging.error("Client Error: %s", ex)
            return None
        except botocore.exceptions.ConnectTimeoutError as ex:
            logging.error("Connection Timeout Error: %s", ex)
            return None
        except botocore.exceptions.ConnectionError as ex:
            logging.error("Connection Error: %s", ex)
            return None
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to connect: %s", ex)
            return None

    def get_security_group(self):
        """
        Get a list of security groups
        """
        try:
            security_groups = self.client.describe_security_groups()
            logging.info("Security group list generated")
            return security_groups
        except Exception as ex: # pylint: disable=broad-except
            logging.error(ex)
            return None

    def delete_security_group(self, security_group):
        """
        Delete Security Group
        """
        try:
            response = self.client.delete_security_group(
                GroupId=str(security_group),
                GroupName=str(security_group),
            )
            logging.info(str(response))
            logging.info("Security Group %s deleted", security_group)
            return response
        except Exception as ex: # pylint: disable=broad-except
            logging.error(ex)
            return None

    def remove_security_group_dependencies(self, security_group):
        """
        Remove Egress and Ingress Security Group dependencies
        """
        try:
            if len(security_group["IpPermissions"]) > 0:
                ingress_response = self.client.revoke_security_group_ingress(
                    GroupId=str(security_group),
                )
            if len(security_group["IpPermissionsEgress"]) > 0:
                egress_response = self.client.revoke_security_group_egress(
                    GroupId=str(security_group),
                )
            logging.info("Ingress deleted: %s", str(ingress_response))
            logging.info("Egress deleted: %s", str(egress_response))
            logging.info("Dependencies removed of Security Group: %s", str(security_group))
            return ingress_response, egress_response
        except Exception as ex: # pylint: disable=broad-except
            logging.error(ex)
            return None
