"""
logging used to stdout info, errors, warning, etc
aws used to manage botocore and boto3 interface
"""
import logging
from aws.aws import AWS as AWSClass # pylint: disable=import-error

class TargetGroup:
    """
    Class used to deal with TargetGroups related entities
    """
    def __init__(self, region):
        self.region = region
        self.client = None

    def client_connect(self):
        """
        Connects to AWS with ELBv2
        """
        try:
            elbv2 = AWSClass(client_type="elbv2", region=self.region)
            self.client = elbv2.client_connect()
            return self.client
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to connect with client on AWS Class: %s", ex)
            return None

    def get_target_groups(self):
        """
        Get a list of Target Groups associated with an Load Balancer ARN
        """
        try:
            target_groups = self.client.describe_target_groups()
            logging.info("Target group list generated")
            return target_groups
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to get the list of Target Groups %s", ex)
            return None

    def get_tags(self, target_group_arn):
        """
        Get Load Balancer tags
        """
        try:
            tags = self.client.describe_tags(
                ResourceArns=[
                    str(target_group_arn),
                ],
            )
            logging.info("Tags from Target group %s generated", target_group_arn)
            return tags
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to get Tags list of Target group: %s, Exception: %s",
                target_group_arn, ex)
            return None

    def delete_target_group(self, target_group_arn):
        """
        Delete Target Group
        """
        try:
            response = self.client.delete_target_group(
                TargetGroupArn=str(target_group_arn)
            )
            logging.info(response)
            logging.info("Target Group deleted: %s", target_group_arn)
            return response
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to delete Target Group: %s, Exception: %s", target_group_arn, ex)
            return None
