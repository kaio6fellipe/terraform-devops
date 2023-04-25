"""
botocore used to catch specific excepctions
boto3 used to communicate with AWS API
"""
import logging
import botocore
import boto3

class TargetGroup:
    """
    Class used to deal with TargetGroups related entities
    """
    def __init__(self, region):
        self.region = region
        self.client = None

    def client_connect(self):
        """
        Connects to AWS
        """
        try:
            self.client = boto3.client('elbv2', region_name=self.region)
            logging.info("Connected to AWS API with elbv2 on region: %s", self.region)
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
