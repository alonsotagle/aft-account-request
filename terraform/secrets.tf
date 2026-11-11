data "aws_ssm_parameter" "aft_secrets" {
  name            = "/aft/config/aft-secrets"
  with_decryption = true
}
