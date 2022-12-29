#########################################
#### User Pool Specific Properties
#########################################
variable "user_pool_name" {
    description = "Name of the User Pool. Required when `create_user_pool` is set true."
    type        = string
}

variable "allow_only_admin_to_create_user_profile" {
    description = "Flag to decide if only the administrator is allowed to create user profiles."
    type        = bool
}

variable "invite_message_template" {
    description = "Configuration Map for Invite message template while creating user profile"
    type = map(string)
}

variable "verification_message_template" {
    description = "Verification Message Template Map"
    type = map(string)
}

variable "case_sensitive_username" {
    description = "Flag to decide whether username case sensitivity will be applied for all users in the user pool through Cognito APIs."
    type        = bool
}

variable "schemas" {
    description = "List of attributes map (with the following properties) of a User Pool"
    type        = any
}

variable "username_attributes" {
    description = "The list of the attributes that can be specified as usernames when a user signs up."
    type        = list(string)
}

variable "alias_attributes" {
    description = "The list of the attributes supported as an alias for this user pool."
    type        = list(string)
}

variable "auto_verified_attributes" {
    description = "The list of the attributes to be auto verified."
    type        = list(string)
}

variable "password_policy" {
    description = "Password Policy Attribute Map"
    type = map(any)
}

variable "mfa_configuration" {
    description = "Multi-Factor Authentication (MFA) configuration for the User Pool."
    type        = string
}

variable "advanced_security_mode" {
    description = "Mode of Advanced Security."
    type        = string
}

variable "lambda_config" {
    description = "ARN of Lambda functions to trigger the different events"
    type = map(string)
}

variable "recovery_mechanisms" {
    description = "Map of recovery mechanisms with each entry is having key as mechanism name and value as priority."
    type        = map(number)
}

variable "domain_name" {
    description = "Either Fully-qualified domain name (for custom domain) or name used as prefix for Amazon Cognito domain."
    type        = string
}

variable "certificate_arn" {
    description = "The ARN of an ISSUED ACM certificate in us-east-1 for a custom domain."
    type        = string
}

variable "tags" {
  description = "A map of tags to assign to the UserPool."
  type        = map(string)
}

#########################################
#### Resource Server Specific Properties
#########################################
variable "resource_servers" {
    description = "List of resource server's configuration map"
    type = any
}

#########################################
#### User Pool Client Specific Properties
#########################################
variable "client_follow_oauth_flows" {
    description = "Flag to decide if App clients are allowed to follow the OAuth protocol when interacting with Cognito user pools."
    type        = bool
}

variable "client_allowed_oauth_flows" {
    description = "List of allowed OAuth flows (code, implicit, client_credentials)."
    type        = list(string)
}

variable "client_allowed_oauth_scopes" {
    description = "List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin)."
    type        = list(string)
}

variable "client_explicit_auth_flows" {
    description = "List of authentication flows."
    type        = list(string)
}

variable "client_token_validity_units" {
    description = "Configuration Map for units in which the validity times are represented in."
    type        = map(string)
}

variable "client_token_validity" {
    description = "Configuration Map of Time limits for all thr tokens after which tokens will no longer valid and cannot be used."
    type        = map(number)
}

variable "client_enable_token_revocation" {
    description = "Flag to decide whether enable token revocation."
    type        = bool
    default     = false
}

variable "client_supported_identity_providers" {
    description = "List of provider names for the identity providers that are supported to the App clients."
    type        = list(string)
}

variable "client_prevent_user_existence_errors" {
    description = "Choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool."
    type        = string
}

variable "client_enable_propagate_additional_user_context_data" {
    description = "Activates the propagation of additional user context data."
    type        = bool
}

variable "app_clients" {
    description = "List of App Clients of userPool where each entry will be a client configuration map."
    type = any
}

#########################################
#### IDP Specific Properties
#########################################
variable "identity_providers" {
    description = "List of Identity providers where each entry will be IDP configuration map."
    type = any
}