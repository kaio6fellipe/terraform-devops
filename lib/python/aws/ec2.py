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
        except botocore.exceptions.ConnectTimeoutError as ex:
            logging.error("Connection Timeout Error: %s", ex)
        except botocore.exceptions.ConnectionError as ex:
            logging.error("Connection Error: %s", ex)
        except Exception as ex:
            logging.error("Failed to connect: %s", ex)

    def get_security_group(self, region):
        """
        dockstring
        """

    def delete_security_group(self, security_group):
        """
        Delete Security Group
        """
        try:
            response = self.client.delete_security_group(
                GroupId=str(security_group),
                GroupName=str(security_group),
            )
            logging.info(response)
            return response
        except Exception as ex:
            logging.error(ex)

    def get_security_group_dependencies(self, region):
        """
        dockstring
        """

    def remove_security_group_dependencies(self, region):
        """
        dockstring
        """
