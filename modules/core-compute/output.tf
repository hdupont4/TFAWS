output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id,
    aws_subnet.public_3.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id,
    aws_subnet.private_3.id
  ]
}

output "alb_dns_name" {
  value = aws_lb.application_lb.dns_name
}

output "alb_arn" {
  value = aws_lb.application_lb.arn
}

output "alb_security_group_id" {
  value = aws_security_group.alb_sg.id
}
