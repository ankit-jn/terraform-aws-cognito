## Provision a Cognito User Pool Domain resource.
resource aws_cognito_user_pool_domain "this" {
    user_pool_id    = aws_cognito_user_pool.this.id
    domain          = var.domain_name
    certificate_arn = var.certificate_arn
}