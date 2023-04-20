import boto3

class LoadBalancer:
    def __init__(self, region):
        self.region = None

    def client_connect(self, region):
        try:
            self.client = boto3.client('elbv2', region_name=self.region)
            return self.client
        except Exception as ex:
            print(ex)

    def get_load_balancers(client):
        load_balancers = client.describe_load_balancers()
        return load_balancers

    def delete_load_balancer(client, load_balancer_arn):
        try:
            response = client.delete_load_balancer(
                LoadBalancerArn=str(load_balancer_arn)
            )
            print(response)
            return response
        except Exception as ex:
            print(ex)

    def get_tags(client, load_balancer_arn):
        tags = client.describe_tags(
            ResourceArns=[
                str(load_balancer_arn),
            ],
        )
        return tags

    def get_listeners(client, load_balancer_arn):
        listeners = client.describe_listeners(
            LoadBalancerArn=str(load_balancer_arn)
        )
        return listeners

    def delete_listener(client, listener_arn):
        try:
            response = client.delete_listener(
                ListenerArn=str(listener_arn)
            )
            print(response)
            return response
        except Exception as ex:
            print(ex)

    def get_rules(client, listener_arn):
        rules = client.describe_rules(
            ListenerArn=str(listener_arn)
        )
        return rules

    def delete_rule(client, rule_arn):
        try:
            response = client.delete_rule(
                RuleArn=str(rule_arn)
            )
            print(response)
            return response
        except Exception as ex:
            print(ex)

class TargetGroup:
    def __init__(self, region):
        self.region = None

    def client_connect(self, region):
        try:
            self.client = boto3.client('elbv2', region_name=self.region)
            return self.client
        except Exception as ex:
            print(ex)

    def get_target_groups(client, load_balancer_arn):
        target_groups = client.describe_target_groups(
            LoadBalancerArn=str(load_balancer_arn),
        )
        return target_groups

    def delete_target_group(client, target_group_arn):
        try:
            response = client.delete_target_group(
                TargetGroupArn=str(target_group_arn)
            )
            print(response)
            return response
        except Exception as ex:
            print(ex)
