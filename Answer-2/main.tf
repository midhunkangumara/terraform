
provider "aws" {
  region = var.aws_region
}
data "aws_ami" "ubuntu_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

module "networking" {
  source   = "./modules/networking"
  vpc_cidr               = var.vpc_cidr
  public_subnet_cidrs    = var.public_subnet_cidrs  
  private_subnet_cidrs   = var.private_subnet_cidrs
  availability_zones     = var.availability_zones
  my_ip                  = var.my_ip
  sg_alb_name            = var.sg_alb_name
  sg_jump_name           = var.sg_jump_name
  sg_ubuntu_name         = var.sg_ubuntu_name
}

module "compute" {
  source            = "./modules/compute"
  aws_region       = var.aws_region 
  vpc_id           = module.networking.vpc_id
  public_subnet_1  = module.networking.public_subnet_1_id
  private_subnet_1 = module.networking.private_subnet_1_id

  jump_sg_id   = module.networking.jump_sg_id
  ubuntu_sg_id = module.networking.ubuntu_sg_id

  jump_ami             = data.aws_ami.ubuntu_ami.id
  ubuntu_ami           = data.aws_ami.ubuntu_ami.id
  instance_type1       = var.instance_type1
  instance_type2       = var.instance_type2

  jump_key_pair_name   = var.jump_key_pair_name
  ubuntu_key_pair_name = var.ubuntu_key_pair_name
  jump_host_name   = var.jump_host_name
  ubuntu_server_name = var.ubuntu_server_name

  jump_key_ssm_path    = var.jump_key_ssm_path
  ubuntu_key_ssm_path  = var.ubuntu_key_ssm_path
  user_data_script2 = var.user_data_script2
  user_data_script = var.user_data_script

}



module "load_balancer" {
  source            = "./modules/load_balancer"
  vpc_id            = module.networking.vpc_id
  public_subnets    = module.networking.public_subnets
  sg_alb            = module.networking.alb_sg_id
  target_id         = module.compute.ubuntu_server_id
  alb_name          = var.alb_name
  target_group_name = var.target_group_name
}

