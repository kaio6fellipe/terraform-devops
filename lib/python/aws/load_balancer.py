"""
logging used to stdout info, errors, warning, etc
aws used to manage botocore and boto3 interface
"""
import logging
from aws.aws import AWS as AWSClass # pylint: disable=import-error

class LoadBalancer:
    """
    Class used to deal with LoadBalancer related entities
    such as: Load Balancers, Listeners and Rules
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

    def get_load_balancers(self):
        """
        Get LoadBalancers list
        """
        try:
            load_balancers = self.client.describe_load_balancers()
            logging.info("Load Balancers list generated and described")
            return load_balancers
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to get Load Balancers list: %s", ex)
            return None

    def delete_load_balancer(self, load_balancer_arn):
        """
        Delete Load Balancer based on the ARN
        """
        try:
            response = self.client.delete_load_balancer(
                LoadBalancerArn=str(load_balancer_arn)
            )
            logging.info(response)
            logging.info("Load balancer deleted with no errors: %s", load_balancer_arn)
            return response
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to delete Load Balancer: %s, Exception: %s",
                load_balancer_arn, ex)
            return None

    def get_tags(self, load_balancer_arn):
        """
        Get Load Balancer tags
        """
        try:
            tags = self.client.describe_tags(
                ResourceArns=[
                    str(load_balancer_arn),
                ],
            )
            logging.info("Tags from Load Balancer %s generated", load_balancer_arn)
            return tags
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to get Tags list of Load balancer: %s, Exception: %s",
                load_balancer_arn, ex)
            return None

    def get_listeners(self, load_balancer_arn):
        """
        Get Listeners associated with a Load Balancer
        """
        try:
            listeners = self.client.describe_listeners(
                LoadBalancerArn=str(load_balancer_arn)
            )
            logging.info("Listeners from Load Balancer %s generated", load_balancer_arn)
            return listeners
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to get Listeners list of load balancer: %s, Exception: %s",
                load_balancer_arn, ex)
            return None

    def delete_listener(self, listener_arn):
        """
        Delete Listener
        """
        try:
            response = self.client.delete_listener(
                ListenerArn=str(listener_arn)
            )
            logging.info(response)
            logging.info("Listener deleted with no errors: %s", listener_arn)
            return response
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to delete listener: %s, Exception: %s", listener_arn, ex)
            return None

    def get_rules(self, listener_arn):
        """
        Get Rules associated with a Listener
        """
        try:
            rules = self.client.describe_rules(
                ListenerArn=str(listener_arn)
            )
            logging.info("Rules from Listener %s generated", listener_arn)
            return rules
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to get Rules of listener: %s, Exception: %s", listener_arn, ex)
            return None

    def delete_rule(self, rule_arn):
        """
        Delete Rule
        """
        try:
            response = self.client.delete_rule(
                RuleArn=str(rule_arn)
            )
            logging.info(response)
            logging.info("Rule deleted with no errors: %s", rule_arn)
            return response
        except Exception as ex: # pylint: disable=broad-except
            logging.error("Failed to delete Rule: %s, Exception: %s", rule_arn, ex)
            return None
