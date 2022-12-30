#########################################
#### Identity Pool Specific Properties
#########################################
variable "identity_pool_name" {
    description = "Name of the Identity Pool."
    type        = string
}

variable "allow_unauthenticated_identities" {
    description = "Flag to decide whether the identity pool supports unauthenticated logins or not."
    type        = bool
}

variable "allow_classic_flow" {
    description = "Flag to decide whether enables or disables the classic / basic authentication flow."
    type        = bool
}

variable "cognito_identity_providers" {
    description = "A list of Amazon Cognito Identity user pools and their client IDs."
    type        = list(map(any))
}

variable "saml_providers" {
    description = "A list of Amazon Resource Names (ARNs) of the SAML provider for your identity."
    type        = list(string)
}

variable "openid_connect_providers" {
    description = "A list of OpendID Connect provider for your identity."
    type        = list(string)
}

variable "supported_login_providers" {
    description = "Key-Value pairs mapping provider names to provider app IDs."
    type        = map(string)
}

variable "developer_provider_name" {
    description = "(Optional) The domain by which Cognito will refer to your users."
    type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Identity Pool."
  type        = map(string)
}