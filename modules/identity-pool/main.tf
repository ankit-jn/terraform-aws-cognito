resource aws_cognito_identity_pool "this" {
    identity_pool_name = var.identity_pool_name
    
    allow_unauthenticated_identities = var.allow_unauthenticated_identities
    allow_classic_flow = var.allow_classic_flow

    tags = merge({"Name" = var.identity_pool_name}, var.tags)
}