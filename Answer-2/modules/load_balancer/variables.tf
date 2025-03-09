variable "vpc_id" {
  description = "VPC ID where the ALB will be deployed"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "sg_alb" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "target_group_name" {
  description = "Name of the Target Group"
  type        = string
}
variable "target_id" {
  description = "ID of the target instance (Ubuntu Server)"
  type        = string
}