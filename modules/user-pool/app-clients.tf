resource aws_cognito_user_pool_client "this" {

    for_each = { for client in var.app_clients: client.name => client }

    user_pool_id = aws_cognito_user_pool.this.id
    name = each.key

    allowed_oauth_flows_user_pool_client = try(each.value.follow_oauth_flows, var.client_follow_oauth_flows)
    allowed_oauth_flows = try(each.value.allowed_oauth_flows, var.client_allowed_oauth_flows)
    allowed_oauth_scopes = try(each.value.allowed_oauth_scopes, var.client_allowed_oauth_scopes)
    explicit_auth_flows = try(each.value.allowed_oauth_scopes, var.client_explicit_auth_flows)

    token_validity_units {
        access_token = try(each.value.token_validity_units.access_unit, try(var.client_token_validity_units.access_unit, "hours")) 
        id_token = try(each.value.token_validity_units.id_unit, try(var.client_token_validity_units.id_unit, "hours")) 
        refresh_token = try(each.value.token_validity_units.refresh_unit, try(var.client_token_validity_units.refresh_unit, "days")) 
    }
    access_token_validity = try(each.value.token_validity.access_token, try(var.client_token_validity.access_token, 1))
    id_token_validity = try(each.value.token_validity.id_token, try(var.client_token_validity.id_token, 1))
    refresh_token_validity = try(each.value.token_validity.refresh_token, try(var.client_token_validity.refresh_token, 60))

    enable_token_revocation = try(each.value.enable_token_revocation, var.client_enable_token_revocation)

    generate_secret = try(each.value.generate_secret, true)

    callback_urls = try(each.value.callback_urls, null)
    logout_urls = try(each.value.logout_urls, null)
    default_redirect_uri = try(each.value.default_redirect_uri, null)

    read_attributes = try(each.value.read_attributes, null)
    write_attributes = try(each.value.write_attributes, null)

    supported_identity_providers = try(each.value.supported_identity_providers, var.client_supported_identity_providers)

    enable_propagate_additional_user_context_data = try(each.value.enable_propagate_additional_user_context_data, var.client_enable_propagate_additional_user_context_data)
    prevent_user_existence_errors = try(each.value.prevent_user_existence_errors, var.client_prevent_user_existence_errors)
}