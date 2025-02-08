data "aws_secretsmanager_secret" "aft_secrets" {
  arn = "arn:aws:secretsmanager:us-east-1:911167915310:secret:aft-secrets-zCQnO0"
}

data "aws_secretsmanager_secret_version" "aft_secrets" {
  secret_id = data.aws_secretsmanager_secret.aft_secrets.id
}
