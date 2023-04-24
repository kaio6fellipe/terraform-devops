import boto3

class EC2:
    def __init__(self, region):
        self.region = None

    def client_connect(self, region):
        try:
            self.client = boto3.client('ec2', region_name=self.region)
            return self.client
        except Exception as ex:
            print(ex)

    def get_security_group(self, region):
        pass

    def delete_security_group(self, region, security_group):
        try:
            response = client.delete_security_group(
                GroupId=str(security_group),
                GroupName=str(security_group),
            )
            print(response)
            return response
        except Exception as ex:
            print(ex)

    def get_security_group_dependencies(self, region):
        pass

    def remove_security_group_dependencies(self, region):
        pass
