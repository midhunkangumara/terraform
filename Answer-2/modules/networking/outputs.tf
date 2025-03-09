output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1_id" {
  value = aws_subnet.public_1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.public_2.id
}
output "public_subnets" {
  value = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}
output "private_subnet_1_id" {
  value = aws_subnet.private_1.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat.id
}

output "alb_sg_id" {
  value = aws_security_group.sg_alb.id
}

output "jump_sg_id" {
  value = aws_security_group.sg_jump.id
}

output "ubuntu_sg_id" {
  value = aws_security_group.sg_ubuntu.id
}
