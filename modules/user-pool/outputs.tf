output "id" {
    description = "ID of the user pool."
    value = aws_cognito_user_pool.this.id
}

output "arn" {
    description = "ARN of the user pool."
    value = aws_cognito_user_pool.this.arn
}

output "endpoint" {
    description = "Endpoint name of the user pool."
    value = aws_cognito_user_pool.this.endpoint
}

output "domain" {
    description = "Holds the domain prefix if the user pool has a domain associated with it."
    value = aws_cognito_user_pool.this.domain
}

output "custom_domain" {
    description = "A custom domain name that is provided to Amazon Cognito."
    value = aws_cognito_user_pool.this.custom_domain
}

output "domain_aws_account_id" {
    description = "The AWS account ID for the user pool owner."
    value       = aws_cognito_user_pool_domain.this.aws_account_id
}

output "domain_cdn_arn" {
    description = "The URL of the CloudFront distribution."
    value       = aws_cognito_user_pool_domain.this.cloudfront_distribution_arn
}

output "domain_s3_bucket" {
    description = "The S3 bucket where the static files for this domain are stored."
    value       = aws_cognito_user_pool_domain.this.s3_bucket
}

output "domain_app_version" {
    description = "The app version."
    value       = aws_cognito_user_pool_domain.this.version
}

output "app_client_ids" {
    description = "The map of App client IDs"
    value       = { for client in var.app_clients: 
                            client.name => aws_cognito_user_pool_client.this[client.name].id }
}