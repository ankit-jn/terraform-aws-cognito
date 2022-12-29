## Provision a Cognito User Pool resource.
resource aws_cognito_user_pool "this" {
    name = var.user_pool_name

    admin_create_user_config {
        allow_admin_create_user_only = var.allow_only_admin_to_create_user_profile

        invite_message_template {
            email_subject = lookup(var.invite_message_template, "email_subject", "Your verification code")
            email_message = lookup(var.invite_message_template, "email_message", "{username}, your verification code is `{####}`")
            sms_message   = lookup(var.invite_message_template, "sms_message", "Your username is {username} and temporary password is `{####}`")
        }
    }

    verification_message_template {
        default_email_option = lookup(var.verification_message_template, "default_email_option", "CONFIRM_WITH_CODE")
        email_subject = local.verification_message_with_code ? lookup(var.verification_message_template, "email_subject", local.email_subject) : null
        email_message = local.verification_message_with_code ? lookup(var.verification_message_template, "email_message", local.email_message) : null
        email_subject_by_link = local.verification_message_with_link ? lookup(var.verification_message_template, "email_subject_by_link", local.email_subject_by_link) : null
        email_message_by_link = local.verification_message_with_link ? lookup(var.verification_message_template, "email_message_by_link", local.email_message_by_link) : null
        sms_message = lookup(var.verification_message_template, "sms_message", local.sms_message)
    }

    username_configuration {
        case_sensitive = var.case_sensitive_username
    }

    dynamic "schema" {
        for_each = var.schemas

        content {
            name = lookup(schema.value, "name")
            required = lookup(schema.value, "required", false)
            attribute_data_type = lookup(schema.value, "attribute_data_type")
            developer_only_attribute = lookup(schema.value, "developer_only_attribute", false)
            mutable = lookup(schema.value, "mutable", true)

            dynamic "string_attribute_constraints" {
                for_each = lookup(schema.value, "attribute_data_type") == "String" ? [1] : []

                content {
                    min_length = lookup(schema.value, "min_length", 0)
                    max_length = lookup(schema.value, "max_length", 2048)
                }
            }

            dynamic "number_attribute_constraints" {
                for_each = lookup(schema.value, "attribute_data_type") == "Number" ? [1] : []

                content {
                    min_value = lookup(schema.value, "min_value", 0)
                    max_value = lookup(schema.value, "max_value", 2048)
                }
            }
        }
    }

    username_attributes = length(var.username_attributes) > 0 ? var.username_attributes : null
    alias_attributes    = (length(var.username_attributes) == 0 
                                && length(var.alias_attributes) > 0) ? var.alias_attributes : null
    
    auto_verified_attributes = length(var.auto_verified_attributes) > 0 ? var.auto_verified_attributes : null

    password_policy {
        minimum_length = try(var.password_policy.minimum_length, 8)
        require_lowercase = try(var.password_policy.require_lowercase, true)
        require_uppercase = try(var.password_policy.require_uppercase, true)
        require_numbers = try(var.password_policy.require_numbers, true)
        require_symbols = try(var.password_policy.require_symbols, true)
        temporary_password_validity_days = try(var.password_policy.temporary_password_validity_days, 7)
    }

    mfa_configuration = var.mfa_configuration

    dynamic "software_token_mfa_configuration" {
        for_each = var.mfa_configuration != "OFF" ? [1] : []

        content {
            enabled = true
        }
    }
    user_pool_add_ons {
        advanced_security_mode = var.advanced_security_mode
    }

    lambda_config {
        create_auth_challenge = lookup(var.lambda_config, "create_auth_challenge", null)
        custom_message = lookup(var.lambda_config, "custom_message", null)
        define_auth_challenge = lookup(var.lambda_config, "define_auth_challenge", null)
        post_authentication = lookup(var.lambda_config, "post_authentication", null)
        post_confirmation = lookup(var.lambda_config, "post_confirmation", null)
        pre_authentication = lookup(var.lambda_config, "pre_authentication", null)
        pre_sign_up = lookup(var.lambda_config, "pre_sign_up", null)
        pre_token_generation = lookup(var.lambda_config, "pre_token_generation", null)
        user_migration = lookup(var.lambda_config, "user_migration", null)
        verify_auth_challenge_response = lookup(var.lambda_config, "verify_auth_challenge_response", null)
    }

    dynamic account_recovery_setting {
        for_each = length(keys(var.recovery_mechanisms)) > 0 ? [1] : [0]

        content {
            dynamic "recovery_mechanism" {
                for_each = var.recovery_mechanisms
                content {
                    name = recovery_mechanism.key
                    priority = recovery_mechanism.value
                }

            }
        }
    }
    tags = merge({"Name" = var.user_pool_name}, var.tags)
}