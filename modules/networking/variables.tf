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


variable "my_ip" {
  description = "Your public IP for SSH access"
  type        = string
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
