terraform {
  source = "../modules/s3.tf"
}

# include {
#   path = find_in_parent_folders()
# }

inputs = {
  bucket_name = "s3-backend-state"
  acl    = "private"

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}