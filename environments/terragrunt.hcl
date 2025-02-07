# terraform {
#   required_version = ">= 1.0.0"

#   backend "s3" {
#     bucket = "s3-backend-state"
#     key    = "terraform/state"
#     region = "us-east-1"
#   }
# }

inputs = {
  region = "us-east-1"
}