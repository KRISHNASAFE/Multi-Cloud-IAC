# Output the public subnet IDs
output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

# Output the security group IDs for web servers
output "security_group_ids" {
  description = "IDs of security groups for web servers"
  value       = aws_security_group.web[*].id
}

# Optionally output the VPC ID
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}
