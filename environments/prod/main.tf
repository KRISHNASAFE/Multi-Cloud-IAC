module "vpc" {
  source = "../../modules/aws/vpc"

  cidr_block = "10.2.0.0/16"
  name       = "prod-vpc"
  aws_region = var.aws_region
}

module "networks" {
  source = "../../modules/azure/networks"

  name       = "prod-vnet"
  cidr_block = "10.2.0.0/16"

  location       = var.azure_location
  resource_group = "test-devops"
}

module "ec2" {
  source = "../../modules/aws/ec2"

  name               = "prod-web-vm"
  ami_id             = var.aws_ami_id # Replace with a valid AMI for your region
  instance_type      = "t2.micro"
  subnet_id          = module.vpc.public_subnet_ids[0]
  security_group_ids = module.vpc.security_group_ids
  environment        = "prod"
}

module "vm" {
  source = "../../modules/azure/vm"

  name           = "prod-web-vm"
  resource_group = "test-devops"
  location       = var.azure_location

  vm_size        = "Standard_D2s_v3"
  admin_username = "azureuser"
  admin_password = var.admin_password

  nic_id = module.networks.nic_id

  environment = "prod"
}
