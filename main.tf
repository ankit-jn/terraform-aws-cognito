module "user_pool" {
    source = "./modules/user-pool"
    
    count = var.create_user_pool ? 1 : 0

    user_pool_name = var.user_pool_name

    allow_only_admin_to_create_user_profile = var.allow_only_admin_to_create_user_profile
    invite_message_template = var.invite_message_template
    verification_message_template = var.verification_message_template
    case_sensitive_username = var.case_sensitive_username
    schemas = var.schemas
    username_attributes = var.username_attributes
    alias_attributes = var.alias_attributes
    auto_verified_attributes = var.auto_verified_attributes
    password_policy = var.password_policy
    mfa_configuration = var.mfa_configuration
    advanced_security_mode = var.advanced_security_mode
    lambda_config = var.lambda_config
    recovery_mechanisms = var.recovery_mechanisms
    domain_name = var.domain_name
    certificate_arn = var.certificate_arn

    tags = var.tags

    resource_servers = var.resource_servers

    client_follow_oauth_flows = var.client_follow_oauth_flows
    client_allowed_oauth_flows = var.client_allowed_oauth_flows
    client_allowed_oauth_scopes = var.client_allowed_oauth_scopes
    client_explicit_auth_flows = var.client_explicit_auth_flows
    client_token_validity_units = var.client_token_validity_units
    client_token_validity = var.client_token_validity
    client_enable_token_revocation = var.client_enable_token_revocation
    client_supported_identity_providers = var.client_supported_identity_providers
    client_prevent_user_existence_errors = var.client_prevent_user_existence_errors
    client_enable_propagate_additional_user_context_data = var.client_enable_propagate_additional_user_context_data
    
    app_clients = var.app_clients
    identity_providers = var.identity_providers
}

module "identity_pool" {
    source = "./modules/identity-pool"
    
    count = var.create_identity_pool ? 1 : 0

    identity_pool_name = var.identity_pool_name
    
    allow_unauthenticated_identities = var.allow_unauthenticated_identities
    allow_classic_flow = var.allow_classic_flow

    cognito_identity_providers  = var.cognito_identity_providers
    saml_providers              = var.saml_providers
    openid_connect_providers    = var.openid_connect_providers
    supported_login_providers   = var.supported_login_providers
    developer_provider_name     = var.developer_provider_name

    tags = var.tags
}