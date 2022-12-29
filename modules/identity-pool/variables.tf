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

variable "tags" {
  description = "A map of tags to assign to the Identity Pool."
  type        = map(string)
}