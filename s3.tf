resource "aws_s3_bucket" "bucket-terraform" {
  bucket = "curso-terraform"
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  object_lock_configuration {
    object_lock_enabled = "Enabled"
  }
  tags = {
    "Name" = "Bucket Curso Terraform"
  }
  
}
