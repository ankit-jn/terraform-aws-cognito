variable "create_user_pool" {
    description = "(Optional) Flag to decide if create Cognito User Pool."
    type        = bool
    default     = true
}

variable "user_pool_name" {
    description = "Name of the User Pool. Required when `create_user_pool` is set true."
    type        = string
    default     = null
}

variable "allow_only_admin_to_create_user_profile" {
    description = "(Optional) Flag to decide if only the administrator is allowed to create user profiles."
    type        = bool
    default     = false
}

variable "invite_message_template" {
    description = <<EOF
Configuration Map for Invite message template while creating user profile

email_subject: (Optional) Subject line for email messages.
email_message: (Optional) Message template for email messages.
sms_message: (Optional) Message template for SMS messages.
EOF
    type = map(string)
    default = {}
}

variable "verification_message_template" {
    description = <<EOF
Verification Message Template Map

default_email_option: (Optional) Default email option. (Default- CONFIRM_WITH_CODE)
email_subject: (Optional) String representing the email verification subject.
email_message:  (Optional) String representing the email verification message.
email_subject_by_link: (Optional) Subject line for the email message template for sending a confirmation link to the user.
email_message_by_link:  (Optional) Email message template for sending a confirmation link to the user, it must contain the {##Click Here##}.
sms_message:  (Optional) String representing the SMS verification message.

EOF
    type = map(string)
    default = {}
}

variable "case_sensitive_username" {
    description = "(Optional) Flag to decide whether username case sensitivity will be applied for all users in the user pool through Cognito APIs."
    type        = bool
    default     = true
}

variable "schemas" {
    description = <<EOF
List of attributes map (with the following properties) of a User Pool

name: (Required) Name of the attribute.
required: (Optional) Whether a user pool attribute is required.
attribute_data_type: (Required) Attribute data type. Must be one of Boolean, Number, String, DateTime.
developer_only_attribute: (Optional) Whether the attribute type is developer only.
mutable: (Optional) Whether the attribute can be changed once it has been created.
min_length: (Optional) Minimum length of an attribute value of the string type.
max_length: (Optional) Maximum length of an attribute value of the string type.
min_value: (Optional) Minimum value of an attribute that is of the number data type.
max_value: (Optional) Maximum value of an attribute that is of the number data type.
EOF
    default = []

    validation {
        condition = length(var.schemas) <= 50
        error_message = "Maximum of 50 attributes are allowed."
    }
}

variable "username_attributes" {
    description = "The list of the attributes that can be specified as usernames when a user signs up."
    type        = list(string)
    default     = []

    validation {
        condition = length([for attribute in var.username_attributes : true
                                    if contains(["phone_number", "email"], attribute)
                            ]) == length(var.username_attributes)
        error_message = "Valid values for `username_attributes` are `phone_number` and `email`."
    }
}

variable "alias_attributes" {
    description = "The list of the attributes supported as an alias for this user pool."
    type        = list(string)
    default     = []

    validation {
        condition = length([for attribute in var.alias_attributes : true
                                    if contains(["phone_number", "email", "preferred_username"], attribute)
                            ]) == length(var.alias_attributes)
        error_message = "Valid values for `alias_attributes` are `phone_number`, `email`, and `preferred_username`."
    }
}

variable "auto_verified_attributes" {
    description = "The list of the attributes to be auto verified."
    type        = list(string)
    default     = []

    validation {
        condition = length([for attribute in var.auto_verified_attributes : true
                                    if contains(["phone_number", "email"], attribute)
                            ]) == length(var.auto_verified_attributes)
        error_message = "Valid values for `auto_verified_attributes` are `phone_number` and `email`."
    }
}

variable "password_policy" {
    description = <<EOF
Password Policy Attribute Map:

minimum_length: (Optional) Minimum length of the password policy to set.
require_lowercase: (Optional) Whether to use at least one lowercase letter in the password.
require_uppercase: (Optional) Whether to use at least one uppercase letter in the password.
require_numbers: (Optional) Whether to use at least one number in the password.
require_symbols: (Optional) Whether to use at least one symbol in the password.
temporary_password_validity_days: The number of days a temporary password is valid.

EOF
    type = map(any)
    default = {}
}

variable "mfa_configuration" {
    description = "(Optional) Multi-Factor Authentication (MFA) configuration for the User Pool."
    type        = string
    default     = "OFF"

    validation {
        condition = contains(["OFF", "ON", "OPTIONAL"], var.mfa_configuration)
        error_message = "Valid values for `mfa_configuration` are `OFF`, `ON` and `OPTIONAL`."
    }
}

variable "advanced_security_mode" {
    description = "(Optional) Mode of Advanced Security."
    type        = string
    default     = "OFF"

    validation {
        condition = contains(["OFF", "AUDIT", "ENFORCED"], var.advanced_security_mode)
        error_message = "Mode for advanced security, must be one of `OFF`, `AUDIT` or `ENFORCED`."
    }
}

variable "lambda_config" {
    description = <<EOF
ARN of Lambda functions to trigger the different events

create_auth_challenge: (Optional) ARN of the lambda creating an authentication challenge.
custom_message: (Optional) Custom Message AWS Lambda trigger.
define_auth_challenge: (Optional) Defines the authentication challenge.
post_authentication: (Optional) Post-authentication AWS Lambda trigger.
post_confirmation: (Optional) Post-confirmation AWS Lambda trigger.
pre_authentication: (Optional) Pre-authentication AWS Lambda trigger.
pre_sign_up: (Optional) Pre-registration AWS Lambda trigger.
pre_token_generation: (Optional) Allow to customize identity token claims before token generation.
user_migration: (Optional) User migration Lambda config type.
verify_auth_challenge_response: (Optional) Verifies the authentication challenge response.
EOF
    type = map(string)
    default = {}
}

variable "recovery_mechanisms" {
    description = "(Optional) Map of recovery mechanisms with each entry is having key as mechanism name and value as priority."
    type        = map(number)
    default     = {}
}

variable "domain_name" {
    description = "(Optional) Either Fully-qualified domain name (for custom domain) or name used as prefix for Amazon Cognito domain."
    type        = string
    default     = "auth"
}

variable "certificate_arn" {
    description = "(Optional) The ARN of an ISSUED ACM certificate in us-east-1 for a custom domain."
    type        = string
    default     = null
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the UserPool."
  type        = map(string)
  default     = {}
}

#########################################
#### UserPool Client Specific Properties
#########################################
variable "client_follow_oauth_flows" {
    description = "(Optional) Flag to decide if App clients are allowed to follow the OAuth protocol when interacting with Cognito user pools."
    type        = bool
    default     = true
}

variable "client_allowed_oauth_flows" {
    description = "(Optional) List of allowed OAuth flows (code, implicit, client_credentials)."
    type        = list(string)
    default     = null
}

variable "client_allowed_oauth_scopes" {
    description = "(Optional) List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin)."
    type        = list(string)
    default     = null
}

variable "client_explicit_auth_flows" {
    description = "(Optional) List of authentication flows."
    type        = list(string)
    default     = null
}

variable "client_token_validity_units" {
    description = <<EOF
Configuration Map for units in which the validity times are represented in.

access_token: (Optional) Time unit in for the value in access_token_validity for app client.
id_token: (Optional) Time unit in for the value in id_token_validity for app client.
refresh_token: (Optional) Time unit in for the value in refresh_token_validity for app client.
EOF
    type        = map(string)
    default     = {
        access_token = "hours"
        id_token = "hours"
        refresh_token = "days"
    }
}

variable "client_token_validity" {
    description = <<EOF
Configuration Map of Time limits for all thr tokens after which tokens will no longer valid and cannot be used.

access_token: (Optional) Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used.
id_token: (Optional) Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used.
refresh_token: (Optional) Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used.
EOF
    type        = map(number)
    default     = {
        access_token = 1
        id_token = 1
        refresh_token = 60
    }
}

variable "client_enable_token_revocation" {
    description = "(Optional) Flag to decide whether enable token revocation."
    type        = bool
    default     = false
}

variable "client_supported_identity_providers" {
    description = "(Optional) List of provider names for the identity providers that are supported to the App clients."
    type        = list(string)
    default     = null
}

variable "client_prevent_user_existence_errors" {
    description = "(Optional) Choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool."
    type        = string
    default     = "ENABLED"

    validation {
        condition = contains(["ENABLED", "LEGACY"], var.client_prevent_user_existence_errors)
        error_message = "Valid values for `client_prevent_user_existence_errors` are `ENABLED` or `LEGACY`."
    }
}

variable "client_enable_propagate_additional_user_context_data" {
    description = "(Optional) Activates the propagation of additional user context data."
    type        = bool
    default     = false
}

variable "app_clients" {
    description = <<EOF
List of App Clients of userPool where each entry will be a client configuration map:

name: (Required) Name of the application client.

follow_oauth_flows: (Optional) Flag to decide if App client is allowed to follow Oauth Protocol. (Override `client_follow_oauth_flows`)
allowed_oauth_flows: (Optional) List of allowed OAuth flows. (Override `client_allowed_oauth_flows`)
allowed_oauth_scopes: (Optional) List of allowed OAuth scopes. (Override `client_allowed_oauth_scopes`)
explicit_auth_flows: (Optional) List of authentication flows.

token_validity_units: (Optional) Token's Validity Units Configuration Map. (Override `client_token_validity_units`)
token_validity: (Optional) Token's Validity Configuration Map. (Override `client_token_validity`)
enable_token_revocation: (Optional) Flag to decide whether enable token revocation.

generate_secret: (Optional) Should an application secret be generated.

callback_urls: (Optional) List of allowed callback URLs for the identity providers.
logout_urls: (Optional) List of allowed logout URLs for the identity providers.
default_redirect_uri: (Optional) Default redirect URI. Must be in the list of callback URLs.

read_attributes: (Optional) List of user pool attributes the application client can read from.
write_attributes: (Optional) List of user pool attributes the application client can write to.

supported_identity_providers: (Optional) List of provider names for the identity providers that are supported on this client.

enable_propagate_additional_user_context_data: (Optional) Activates the propagation of additional user context data.
prevent_user_existence_errors: (Optional) Choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool.
EOF
    type = any
    default = []
}