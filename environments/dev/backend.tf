terraform {
  backend "s3" {
    bucket         = "multi-cloud-iac-dev-tfstate"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks-dev"
    encrypt        = true
  }
}
