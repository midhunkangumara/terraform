#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y  awscli jq
AWS_REGION="us-east-1"
ACCOUNT_ID=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .accountId)
UBUNTU_KEY_SSM_PATH="/test/ubuntu_key"
# Define paths
UBUNTU_KEY_PATH="/home/ubuntu/ubuntu_server_key.pem"
UBUNTU_KEY_SSM_NAME="arn:aws:ssm:${AWS_REGION}:${ACCOUNT_ID}:parameter${UBUNTU_KEY_SSM_PATH}"

# Fetch the private key from AWS SSM Parameter Store and store it securely
aws ssm get-parameter --name "$UBUNTU_KEY_SSM_NAME" --region us-east-1 --with-decryption --query "Parameter.Value" --output text > "$UBUNTU_KEY_PATH"

# Set correct permissions
chmod 400 "$UBUNTU_KEY_PATH"
chown ubuntu:ubuntu "$UBUNTU_KEY_PATH"

echo "Ubuntu private key has been securely stored at $UBUNTU_KEY_PATH"
