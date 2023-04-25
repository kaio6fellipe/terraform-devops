"""
logging used to stdout info, errors, warning, etc
aws used to manage botocore and boto3 interface
"""
import logging
from aws.aws import AWS as AWSClass # pylint: disable=import-error

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
        Connects to AWS with EC2
        """
        try:
            ec2 = AWSClass(client_type="ec2", region=self.region)
            self.client = ec2.client_connect()
            return self.client
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to connect with client on AWS Class: %s", ex)
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
