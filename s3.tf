resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state"

  tags = {
    Name        = "Terraform-State"
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}
