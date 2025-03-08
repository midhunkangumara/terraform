variable "vpc_id" {
  description = "VPC ID where the instances will be deployed"
  type        = string
}

variable "public_subnet_1" {
  description = "Public subnet ID for the Jump Host"
  type        = string
}

variable "private_subnet_1" {
  description = "Private subnet ID for the Ubuntu Server"
  type        = string
}

variable "jump_sg_id" {
  description = "Security group ID for the Jump Host"
  type        = string
}

variable "ubuntu_sg_id" {
  description = "Security group ID for the Ubuntu Server"
  type        = string
}

variable "jump_ami" {
  description = "AMI ID for the Jump Host"
  type        = string
  default     = "ami-123456"  # Replace with a valid default AMI
}

variable "jump_instance_type" {
  description = "Instance type for the Jump Host"
  type        = string
  default     = "t2.micro"
}

variable "ubuntu_ami" {
  description = "AMI ID for the Ubuntu Server"
  type        = string
  default     = "ami-123456"  # Replace with a valid default AMI
}

variable "ubuntu_instance_type" {
  description = "Instance type for the Ubuntu Server"
  type        = string
  default     = "t2.micro"
}

variable "jump_key_pair_name" {
  description = "Key pair name for the Jump Host"
  type        = string
}

variable "ubuntu_key_pair_name" {
  description = "Key pair name for the Ubuntu Server"
  type        = string
}

variable "instance_type1" {
  description = "Instance type for the Jump Host"
  type        = string
}

variable "instance_type2" {
  description = "Instance type for the Ubuntu Server"
  type        = string
}
variable "jump_host_name" {
  description = "Name of the Jump Host instance"
  type        = string
}

variable "ubuntu_server_name" {
  description = "Name of the Ubuntu Server instance"
  type        = string
}
variable "user_data_script" {
  description = "User data script for Ubuntu instance"
  type        = string
}
variable "jump_key_ssm_path" {
  description = "SSM Parameter Store path for Jump Server private key"
  type        = string
}

variable "ubuntu_key_ssm_path" {
  description = "SSM Parameter Store path for Ubuntu Server private key"
  type        = string
}
variable "aws_region" {
  description = "AWS region to be used for resources"
  type        = string
}
variable "user_data_script2" {
  description = "Path to the user data script for the Ubuntu server"
  type        = string
}