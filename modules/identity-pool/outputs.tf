output "id" {
    description = "ID of the user pool."
    value = aws_cognito_identity_pool.this.id
}

output "arn" {
    description = "ARN of the user pool."
    value = aws_cognito_identity_pool.this.arn
}
