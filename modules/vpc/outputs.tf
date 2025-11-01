output "private_subnet_ids" {
  value       = [for s in aws_subnet.private : s.id]
  description = "List of private subnet IDs"
}

output "public_subnet_ids" {
  value       = [for s in aws_subnet.public : s.id]
  description = "List of public subnet IDs"
}

output "sg_app_id" {
  value       = aws_security_group.default.id
  description = "App security group ID"
}

output "bastion_sg_id" {
  value       = aws_security_group.bastion.id
  description = "Bastion security group ID"
}