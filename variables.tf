# AWS Region
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Public IP for SSH Access
variable "my_ip" {
  description = "Your public IP for SSH access"
  type        = string
}

# VPC Configuration
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}


# Compute Variables
variable "instance_type1" {
  description = "Instance type for the Jump Host"
  type        = string
  default     = "t3.micro"
}

variable "instance_type2" {
  description = "Instance type for the Ubuntu Server"
  type        = string
  default     = "t3.micro"
}



# Key Pair Names
variable "jump_key_pair_name" {
  description = "Key pair name for Jump Server"
  type        = string
}

variable "ubuntu_key_pair_name" {
  description = "Key pair name for Ubuntu Server"
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
variable "namespace" {
  description = "Namespace for the environment "
  type        = string
  default     = ""
}
variable "alb_name" {
  description = "Name of the ALB"
  type        = string
  default     = "app-load-balancer-dev"
}

variable "target_group_name" {
  description = "Name of the Target Group"
  type        = string
  default     = "app-tg-dev"
}

variable "sg_alb_name" {
  description = "Name of ALB security group"
  type        = string
}

variable "sg_jump_name" {
  description = "Name of Jump Host security group"
  type        = string
}

variable "sg_ubuntu_name" {
  description = "Name of Ubuntu security group"
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
variable "user_data_script" {
  description = "Path to the user data script for the Ubuntu server"
  type        = string
}
variable "user_data_script2" {
  description = "Path to the user data script for the Ubuntu server"
  type        = string
}