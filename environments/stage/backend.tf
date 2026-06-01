terraform {
  backend "s3" {
    bucket         = "multi-cloud-iac-stage-tfstate"
    key            = "stage/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks-stage"
    encrypt        = true
  }
}
