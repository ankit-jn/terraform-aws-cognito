## Provision a Cognito User Pool Domain resource.
resource aws_cognito_user_pool_domain "this" {
    count = var.create_user_pool ? 1 : 0
    
    user_pool_id    = aws_cognito_user_pool.this[0].id
    domain          = var.domain_name
    certificate_arn = var.certificate_arn
}