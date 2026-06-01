variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "azure_location" {
  description = "Azure location to deploy resources"
  type        = string
}

variable "admin_password" {
  description = "Admin password for Azure VM"
  type        = string
  sensitive   = true
}

variable "aws_ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}
