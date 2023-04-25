"""
botocore used to catch specific excepctions
boto3 used to communicate with AWS API
"""
import logging
import botocore
import boto3

class AWS:
    """
    Class used to deal with general methods of AWS API
    """
    def __init__(self, region, client_type):
        self.region = str(region)
        self.client_type = str(client_type)
        self.client = None

    def client_connect(self):
        """
        Connects to AWS
        """
        try:
            self.client = boto3.client(self.client_type, region_name=self.region)
            logging.info("Connected to AWS API with %s on region: %s",
                self.client_type, self.region)
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
