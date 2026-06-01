provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tf_state" {
  for_each = toset(var.environments)

  bucket = "multi-cloud-iac-${each.key}-tfstate"
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  for_each = aws_s3_bucket.tf_state

  bucket = each.value.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state" {
  for_each = aws_s3_bucket.tf_state

  bucket = each.value.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "tf_locks" {
  for_each = toset(var.environments)

  name         = "terraform-locks-${each.key}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
