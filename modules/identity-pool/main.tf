resource aws_cognito_identity_pool "this" {
    identity_pool_name = var.identity_pool_name
    
    allow_unauthenticated_identities = var.allow_unauthenticated_identities
    allow_classic_flow = var.allow_classic_flow

    dynamic "cognito_identity_providers" {
        for_each = var.cognito_identity_providers
        iterator = idp

        content {
            client_id               = idp.value.userpool_client_id
            provider_name           = idp.value.userpool_endpoint
            server_side_token_check = idp.value.server_side_token_check
        }
    }

    saml_provider_arns = var.saml_providers
    openid_connect_provider_arns = var.openid_connect_providers
    supported_login_providers = var.supported_login_providers
    developer_provider_name = var.developer_provider_name

    tags = merge({"Name" = var.identity_pool_name}, var.tags)
}