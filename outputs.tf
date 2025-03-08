output "alb_dns_name" {
  description = "ALB DNS name"
  value       = module.load_balancer.alb_dns_name
}
output "jump_host_public_ip" {
  value = module.compute.jump_host_public_ip
}

output "jump_host_private_ip" {
  value = module.compute.jump_host_private_ip
}

output "ubuntu_server_private_ip" {
  value = module.compute.ubuntu_server_private_ip
}
output "jump_server_key_ssm_arn" {
  value = module.compute.jump_server_key_ssm_arn
}

output "ubuntu_server_key_ssm_arn" {
  value = module.compute.ubuntu_server_key_ssm_arn
}