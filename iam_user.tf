# IAM group for developers
resource "aws_iam_group" "developers" {
  name = "developers"
}

# Attach S3 read policy to developers group
resource "aws_iam_group_policy_attachment" "developers_s3_read" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.s3_read.arn
}

# Attach secrets read policy to developers group
resource "aws_iam_group_policy_attachment" "developers_secrets_read" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.secrets_read.arn
}

# IAM user
resource "aws_iam_user" "developer" {
  name = "developer-user"
}

# Add user to developers group
resource "aws_iam_user_group_membership" "developer" {
  user = aws_iam_user.developer.name

  groups = [
    aws_iam_group.developers.name
  ]
}