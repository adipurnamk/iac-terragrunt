
variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket"
}

variable "acl" {
  type        = string
  default     = "private"
  description = "The ACL of the S3 bucket"
}

variable "versioning_enabled" {
  type        = bool
  default     = true
  description = "Enable versioning on the S3 bucket"
}

variable "sse_algorithm" {
  type        = string
  default     = "AES256"
  description = "The server-side encryption algorithm to use"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  acl    = var.acl

  versioning {
    enabled = var.versioning_enabled
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }
}