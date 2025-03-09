# AWS Region and Networking
aws_region            = "us-east-1"
vpc_cidr              = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]
my_ip            = "0.0.0.0/0"

# Compute Instance Types
instance_type1   = "t2.micro"
instance_type2 = "t2.micro"

# Dynamic Naming Based on Workspace
jump_key_pair_name   = "test-jump-key"
ubuntu_key_pair_name = "test-ubuntu-key"



jump_host_name       = "test-jump-server"
ubuntu_server_name   = "test-ubuntu-server"
# Add ALB and Target Group names dynamically
alb_name            = "test-app-load-balancer"
target_group_name   = "test-app-tg"
# Dynamically set Security Group names
sg_alb_name    = "test-alb-sg"
sg_jump_name   = "test-jump-sg"
sg_ubuntu_name = "test-ubuntu-sg"
jump_key_ssm_path = "/test/jump_key"
ubuntu_key_ssm_path =  "/test/ubuntu_key"
user_data_script = "./scripts/nginx.sh"
user_data_script2 = "./scripts/jump.sh"