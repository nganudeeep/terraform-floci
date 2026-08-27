#!/bin/bash

echo "Running EC2 instances:"
aws --endpoint-url http://localhost:4566 ec2 describe-instances \
  --query 'Reservations[].Instances[].{Name:Tags[?Key==`Name`]|[0].Value,ID:InstanceId,AMI:ImageId,State:State.Name}' \
  --output table

echo ""
echo "EBS volumes:"
aws --endpoint-url http://localhost:4566 ec2 describe-volumes \
  --query 'Volumes[].{ID:VolumeId,Size:Size,Type:VolumeType,State:State}' \
  --output table