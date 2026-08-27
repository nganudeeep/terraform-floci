resource "aws_secretsmanager_secret" "app_secret" {
  name        = "app-secret"
  description = "Demo application secret"

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "aws_secretsmanager_secret_version" "app_secret" {
  secret_id = aws_secretsmanager_secret.app_secret.id

  secret_string = jsonencode({
    username = "admin"
    password = "demo-password"
  })
}