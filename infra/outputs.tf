output "s3_buckets" {
  value = {
    for env, bucket in aws_s3_bucket.tf_state :
    env => bucket.id
  }
}

output "dynamodb_tables" {
  value = {
    for env, table in aws_dynamodb_table.tf_locks :
    env => table.name
  }
}
