import boto3

ec2 = boto3.client(
    "ec2",
    endpoint_url="http://localhost:4566",
    region_name="us-east-1",
    aws_access_key_id="test",
    aws_secret_access_key="test"
)

response = ec2.describe_instances()

print("\nEC2 Instance Inventory")
print("-" * 80)

for reservation in response["Reservations"]:
    for instance in reservation["Instances"]:
        name = "N/A"

        for tag in instance.get("Tags", []):
            if tag["Key"] == "Name":
                name = tag["Value"]

        print(f"Name:          {name}")
        print(f"Instance ID:   {instance['InstanceId']}")
        print(f"AMI ID:        {instance['ImageId']}")
        print(f"Type:          {instance['InstanceType']}")
        print(f"State:         {instance['State']['Name']}")
        print("-" * 80)