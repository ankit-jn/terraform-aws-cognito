## Provision a Cognito User Pool Domain resource.
resource aws_cognito_user_pool_domain "this" {
    user_pool_id    = aws_cognito_user_pool.this.id
    domain          = coalesce(var.domain_name, var.user_pool_name)
    certificate_arn = var.certificate_arn
}