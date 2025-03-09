# Terraform Deployment Guide

## Prerequisites
Before using this Terraform setup, ensure you have:
- Terraform installed ([Install Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))
- AWS CLI installed and configured with appropriate IAM permissions ([AWS CLI Install Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html))


## Usage Instructions

### Step 1: Initialize Terraform
Run the following command to initialize Terraform:
```sh
terraform init
```

### Step 2: Configure Variables
Update the `dev.tfvars` file with the required values, or create a new one based on it.

### Step 3: Plan the Terraform Deployment
To review the changes before applying, execute:
```sh
terraform plan -var-file=dev.tfvars
```

### Step 4: Apply the Terraform Configuration
To create resources as per the Terraform configuration, run:
```sh
terraform apply -var-file=dev.tfvars
```
Confirm the apply process by typing `yes` when prompted.

## Expected Outputs
After successful deployment, Terraform will display the following outputs:
- **alb_dns_name**: DNS name of the Application Load Balancer (ALB)
- **jump_host_public_ip**: Public IP of the Jump Server
- **jump_host_private_ip**: Private IP of the Jump Server
- **ubuntu_server_private_ip**: Private IP of the Ubuntu Server
- **jump_server_key_ssm_arn**: ARN of the Jump Server private key stored in AWS SSM Parameter Store
- **ubuntu_server_key_ssm_arn**: ARN of the Ubuntu Server private key stored in AWS SSM Parameter Store

## Downloading Private Key from AWS SSM
To retrieve the Ubuntu Server private key from AWS SSM, use the following command:
```sh
aws ssm get-parameter --name "arn:aws:ssm:<AWS_REGION>:<ACCOUNT_ID>:parameter/<PATH_TO_UBUNTU_KEY>" --region <AWS_REGION> --with-decryption --query "Parameter.Value" --output text > ubuntu_key.pem
```

To retrieve the Jump Server private key, use:
```sh
aws ssm get-parameter --name "arn:aws:ssm:<AWS_REGION>:<ACCOUNT_ID>:parameter/<PATH_TO_JUMP_KEY>" --region <AWS_REGION> --with-decryption --query "Parameter.Value" --output text > jump_key.pem
```

After downloading, ensure proper file permissions:
```sh
chmod 400 ubuntu_key.pem
chmod 400 jump_key.pem
```

## Destroying Resources
To remove all created resources, use:
```sh
terraform destroy -var-file=dev.tfvars
```
Confirm the destroy process by typing `yes` when prompted.

---
This guide provides a step-by-step process to deploy infrastructure using Terraform and manage SSH keys securely via AWS SSM.

