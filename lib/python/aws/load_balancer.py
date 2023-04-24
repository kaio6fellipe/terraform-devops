"""
botocore used to catch specific excepctions
boto3 used to communicate with AWS API
"""
import botocore
import boto3

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
        Connects to AWS
        """
        try:
            self.client = boto3.client('elbv2', region_name=self.region)
            return self.client
        except botocore.exceptions.ClientError as ex:
            print("Client Error: ", ex)
        except botocore.exceptions.ConnectTimeoutError as ex:
            print("Connection Timeout Error: ", ex)
        except botocore.exceptions.ConnectionError as ex:
            print("Connection Error: ", ex)
        except Exception as ex:
            print("Failed to connect: ", ex)

    def get_load_balancers(self):
        """
        Get LoadBalancers list
        """
        try:
            load_balancers = self.client.describe_load_balancers()
            return load_balancers
        except Exception as ex:
            print("Failed to get Load Balancers list: ", ex)

    def delete_load_balancer(self, load_balancer_arn):
        """
        Delete Load Balancer based on the ARN
        """
        try:
            response = self.client.delete_load_balancer(
                LoadBalancerArn=str(load_balancer_arn)
            )
            print(response)
            return response
        except Exception as ex:
            print("Failed to delete Load Balancer: " + load_balancer_arn + ", Exception: ", ex)

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
            return tags
        except Exception as ex:
            print("Failed to get Tags list of Load balancer: " + load_balancer_arn + ", Exception: ", ex)

    def get_listeners(self, load_balancer_arn):
        """
        Get Listeners associated with a Load Balancer
        """
        try:
            listeners = self.client.describe_listeners(
                LoadBalancerArn=str(load_balancer_arn)
            )
            return listeners
        except Exception as ex:
            print("Failed to get Listeners list of load balancer: " + load_balancer_arn + ", Exception: ", ex)

    def delete_listener(self, listener_arn):
        """
        Delete Listener
        """
        try:
            response = self.client.delete_listener(
                ListenerArn=str(listener_arn)
            )
            print(response)
            return response
        except Exception as ex:
            print("Failed to delete listener: " + listener_arn + ", Exception: ", ex)

    def get_rules(self, listener_arn):
        """
        Get Rules associated with a Listener
        """
        try:
            rules = self.client.describe_rules(
                ListenerArn=str(listener_arn)
            )
            return rules
        except Exception as ex:
            print("Failed to get Rules of listener: " + listener_arn + ", Exception: ", ex)

    def delete_rule(self, rule_arn):
        """
        Delete Rule
        """
        try:
            response = self.client.delete_rule(
                RuleArn=str(rule_arn)
            )
            print(response)
            return response
        except Exception as ex:
            print("Failed to delete Rule: " + rule_arn + ", Exception: ", ex)

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
            return self.client
        except botocore.exceptions.ClientError as ex:
            print("Client Error: ", ex)
        except botocore.exceptions.ConnectTimeoutError as ex:
            print("Connection Timeout Error: ", ex)
        except botocore.exceptions.ConnectionError as ex:
            print("Connection Error: ", ex)
        except Exception as ex:
            print("Failed to connect: ", ex)

    def get_target_groups(self, load_balancer_arn):
        """
        Get a list of Target Groups associated with an Load Balancer ARN
        """
        try:
            target_groups = self.client.describe_target_groups(
                LoadBalancerArn=str(load_balancer_arn),
            )
            return target_groups
        except Exception as ex:
            print("Failed to get the list of Target Groups of load balancer: " + load_balancer_arn + ", Exception: ", ex)

    def delete_target_group(self, target_group_arn):
        """
        Delete Target Group
        """
        try:
            response = self.client.delete_target_group(
                TargetGroupArn=str(target_group_arn)
            )
            print(response)
            return response
        except Exception as ex:
            print("Failed to delete Target Group: " + target_group_arn + ", Exception: ", ex)
