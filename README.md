# Terraform AWS Infrastructure with Floci

This project is a hands-on Terraform project built using Floci, a local AWS emulator. The purpose of this project was to learn and practice Terraform by creating and managing AWS-style infrastructure locally without using real AWS resources.

## Environment

- Terraform
- AWS Provider
- Floci
- Docker
- AWS CLI
- macOS
- Local Floci endpoint: `http://localhost:4566`
- AWS Region: `us-east-1`

## Infrastructure Created

The Terraform configuration covers:

- VPC
- Public and private subnets
- Internet Gateway
- Route Tables
- Security Groups
- EC2 instances
- EBS volumes
- EBS volume attachments
- S3 bucket
- S3 objects
- IAM users
- IAM roles
- AWS Secrets Manager
- Amazon EKS cluster
- EKS IAM roles
- Terraform modules

## Terraform Concepts Practiced

- Terraform provider configuration
- Variables and `terraform.tfvars`
- Outputs
- Terraform state
- Backend configuration
- Resources
- Modules
- `count`
- `for_each`
- Resource dependencies
- Resource imports
- Creating and destroying infrastructure
- Managing multiple EC2 instances
- Working with AWS networking
- IAM configuration
- EBS storage
- S3
- EKS
- Secrets Manager

## Floci Configuration

Floci was used as the local AWS environment.

```bash
export AWS_ENDPOINT_URL=http://localhost:4566
export AWS_ACCESS_KEY_ID=test
export AWS_SECRET_ACCESS_KEY=test
export AWS_DEFAULT_REGION=us-east-1

Most used cmd:

1. aws s3 ls \
  --endpoint-url http://localhost:4566

2. aws s3 rm s3://terraform-state \
  --recursive \
  --endpoint-url http://localhost:4566

3. aws s3api list-object-versions \
  --bucket terraform-state \
  --endpoint-url http://localhost:4566 \
  --no-cli-pager