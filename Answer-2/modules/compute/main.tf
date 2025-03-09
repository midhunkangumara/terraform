
data "aws_caller_identity" "current" {}
# Generate RSA key for Jump Server
resource "tls_private_key" "jump_server_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# Store Jump Server key pair in AWS
resource "aws_key_pair" "jump_key" {
  key_name   = var.jump_key_pair_name
  public_key = tls_private_key.jump_server_key.public_key_openssh

  lifecycle {
    # prevent_destroy = true
    ignore_changes  = [public_key]
  }
}
# Store Jump Server Private Key in AWS SSM Parameter Store
resource "aws_ssm_parameter" "jump_server_key" {
  name        = var.jump_key_ssm_path
  description = "Private key for Jump Server"
  type        = "SecureString"
  value       = tls_private_key.jump_server_key.private_key_pem

  lifecycle {
    ignore_changes = [value]
  }
}
# Generate RSA key for Ubuntu Server
resource "tls_private_key" "ubuntu_server_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Store Ubuntu Server key pair in AWS
resource "aws_key_pair" "ubuntu_key" {
  key_name   = var.ubuntu_key_pair_name
  public_key = tls_private_key.ubuntu_server_key.public_key_openssh

  lifecycle {
    # prevent_destroy = true
    ignore_changes  = [public_key]
  }
}
# Store Ubuntu Server Private Key in AWS SSM Parameter Store
resource "aws_ssm_parameter" "ubuntu_server_key" {
  name        = var.ubuntu_key_ssm_path
  description = "Private key for Ubuntu Server"
  type        = "SecureString"
  value       = tls_private_key.ubuntu_server_key.private_key_pem

  lifecycle {
    ignore_changes = [value]
  }
}

# IAM Role for Jump Server
resource "aws_iam_role" "jump_server_role" {
  name = "jump-server-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

# IAM Policy to Allow Jump Server to Read SSM Parameter Store
resource "aws_iam_policy" "jump_server_ssm_policy" {
  name        = "jump-server-ssm-policy"
  description = "Allow Jump Server to read private key from SSM Parameter Store"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "ssm:GetParameter",
        "ssm:GetParameters",
        "ssm:GetParameterHistory"
      ]
      Resource = [
            "arn:aws:ssm:${var.aws_region}:${data.aws_caller_identity.current.account_id}:parameter${var.ubuntu_key_ssm_path}"
      ]
    }]
  })
}
# Attach Policy to IAM Role
resource "aws_iam_role_policy_attachment" "jump_server_ssm_attach" {
  role       = aws_iam_role.jump_server_role.name
  policy_arn = aws_iam_policy.jump_server_ssm_policy.arn
}

# Create IAM Instance Profile to Attach Role to EC2 Instance
resource "aws_iam_instance_profile" "jump_server_profile" {
  name = "jump-server-profile"
  role = aws_iam_role.jump_server_role.name
}

# Jump Host (Bastion) in Public Subnet
resource "aws_instance" "jump_host" {
  ami                    = var.jump_ami
  instance_type          = var.instance_type1
  key_name               = aws_key_pair.jump_key.key_name
  subnet_id              = var.public_subnet_1
  vpc_security_group_ids = [var.jump_sg_id]
  user_data              = file(var.user_data_script2)
  iam_instance_profile   = aws_iam_instance_profile.jump_server_profile.name
  tags = { Name = var.jump_host_name }
}

# Ubuntu Server in Private Subnet
resource "aws_instance" "ubuntu_server" {
  ami                    = var.ubuntu_ami
  instance_type          = var.instance_type2
  key_name               = aws_key_pair.ubuntu_key.key_name
  subnet_id              = var.private_subnet_1
  vpc_security_group_ids = [var.ubuntu_sg_id]
  user_data              = file(var.user_data_script)

  tags = {  Name = var.ubuntu_server_name }
}
