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

#Steps to verify the setup.
### 1️⃣ Access the Ubuntu Server via ALB  
Use the **ALB DNS name** from the Terraform output to access the Ubuntu server on **port 80**.

### 2️⃣ Retrieve and Access the Jump Server  
1. Retrieve the **Jump Server key** using AWS CLI:  
   ```sh
   aws ssm get-parameter --name "<jump_server_key_ssm_arn>" --region us-east-1 --with-decryption --query "Parameter.Value" --output text > jump_server_key.pem
   ```
2. Update file permissions:  
   ```sh
   chmod 400 jump_server_key.pem
   ```
3. SSH into the Jump Server:  
   ```sh
   ssh -i jump_server_key.pem ubuntu@<jump_host_public_ip>
   ```

### 3️⃣ Retrieve and Access the Ubuntu Server  
1. Retrieve the **Ubuntu Server key** inside the Jump Server:  
   ```sh
   aws ssm get-parameter --name "<ubuntu_server_key_ssm_arn>" --region us-east-1 --with-decryption --query "Parameter.Value" --output text > /home/ubuntu/ubuntu_server_key.pem
   ```
2. Update file permissions:  
   ```sh
   chmod 400 /home/ubuntu/ubuntu_server_key.pem
   ```
3. SSH into the Ubuntu Server from the Jump Server:  
   ```sh
   ssh -i /home/ubuntu/ubuntu_server_key.pem ubuntu@<ubuntu_server_private_ip>
   ```

### 4️⃣ Retrieve Required Values from Terraform Output  
Ensure you fetch the necessary values from the Terraform output:  
- **Jump Server Key ARN:** `jump_server_key_ssm_arn`  
- **Jump Server Public IP:** `jump_host_public_ip`  
- **Ubuntu Server Key ARN:** `ubuntu_server_key_ssm_arn`  
- **Ubuntu Server Private IP:** `ubuntu_server_private_ip`  

Run the following Terraform command to get the output values:  
```sh
terraform output