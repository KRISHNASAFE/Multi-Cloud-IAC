variable "environments" {
  type    = list(string)
  default = ["dev", "stage", "prod"]
}

variable "region" {
  type    = string
  default = "us-east-1"
}
