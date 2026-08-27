resource "aws_s3_object" "example" {
  bucket  = aws_s3_bucket.terraform_state.id
  key     = "devops/example.txt"
  content = "Hello from Terraform!"

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}