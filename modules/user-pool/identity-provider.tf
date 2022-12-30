resource aws_cognito_identity_provider "this" {

    for_each = { for idp in var.identity_providers: idp.provider_name => idp }

    user_pool_id = aws_cognito_user_pool.this.id

    provider_name = each.key
    provider_type = each.value.provider_type

    provider_details = {
        client_id = contains(["Google", "LoginWithAmazon", "Facebook", "OIDC", "SignInWithApple"], each.value.provider_type) ? each.value.provider_details.client_id : null
        client_secret = contains(["Google", "LoginWithAmazon", "Facebook", "OIDC"], each.value.provider_type) ? each.value.provider_details.client_secret : null
        authorize_scopes = contains(["Google", "LoginWithAmazon", "Facebook", "SignInWithApple", "OIDC"], each.value.provider_type) ? each.value.provider_details.authorize_scopes : null
        team_id = contains(["SignInWithApple"], each.value.provider_type) ? each.value.provider_details.team_id : null
        key_id = contains(["SignInWithApple"], each.value.provider_type) ? each.value.provider_details.key_id : null
        private_key = contains(["SignInWithApple"], each.value.provider_type) ? each.value.provider_details.private_key : null
        attributes_request_method = contains(["OIDC"], each.value.provider_type) ? each.value.provider_details.attributes_request_method : null
        oidc_issuer = contains(["Google", "OIDC"], each.value.provider_type) ? each.value.provider_details.oidc_issuer : null
        MetadataFile = contains(["SAML"], each.value.provider_type) ? lookup(each.value.provider_details, "MetadataFile", null) : null
        MetadataURL = contains(["SAML"], each.value.provider_type) ? lookup(each.value.provider_details, "MetadataURL", null) : null
        IDPSignout = contains(["SAML"], each.value.provider_type) ? lookup(each.value.provider_details, "IDPSignout", null) : null
        authorize_url = contains(["Google", "Facebook","LoginWithAmazon"], each.value.provider_type) ? each.value.provider_details.authorize_url : null
        token_url = contains(["Google", "Facebook", "LoginWithAmazon"], each.value.provider_type) ? each.value.provider_details.token_url : null
        token_request_method = contains(["Google", "Facebook", "LoginWithAmazon"], each.value.provider_type) ? each.value.provider_details.token_request_method : null
        attributes_url = contains(["Google", "Facebook", "LoginWithAmazon"], each.value.provider_type) ? each.value.provider_details.attributes_url : null
        attributes_url_add_attributes = contains(["Google", "Facebook", "LoginWithAmazon", "OIDC"], each.value.provider_type) ? each.value.provider_details.attributes_url_add_attributes : null
    }

    idp_identifiers = lookup(each.value, "idp_identifiers", [])
    attribute_mapping = lookup(each.value, "attribute_mapping", {})
}