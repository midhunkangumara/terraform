output "jump_host_id" {
  description = "ID of the Jump Host EC2 instance"
  value       = aws_instance.jump_host.id
}

output "ubuntu_server_id" {
  description = "ID of the Ubuntu server in the private subnet"
  value       = aws_instance.ubuntu_server.id
}
output "jump_host_public_ip" {
  value = aws_instance.jump_host.public_ip
}

output "jump_host_private_ip" {
  value = aws_instance.jump_host.private_ip
}

output "ubuntu_server_private_ip" {
  value = aws_instance.ubuntu_server.private_ip
}
output "jump_server_key_ssm_arn" {
  description = "ARN of the SSM Parameter Store entry for Jump Server private key"
  value       = aws_ssm_parameter.jump_server_key.arn
}

output "ubuntu_server_key_ssm_arn" {
  description = "ARN of the SSM Parameter Store entry for Ubuntu Server private key"
  value       = aws_ssm_parameter.ubuntu_server_key.arn
}

