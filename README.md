## ARJ-Stack: AWS Cognito Terraform module

A Terraform module for configuring Cognito UserPool/Identity Pool

### Resources
This module features the following components to be provisioned:

- Cognito User Pool [[aws_cognito_user_pool](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool)]
- Cognito User Pool Domain [[aws_cognito_user_pool_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_domain)]
- Cognito Resource Server [[aws_cognito_resource_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_resource_server)]
- Cognito User Identity Provider [[aws_cognito_identity_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_identity_provider)]
- Cognito User Pool App Client [[aws_cognito_user_pool_client](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client)]
- Cognito Identity Pool [[aws_cognito_identity_pool](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_identity_pool)]

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.22.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.22.0 |

### Examples

Refer [Configuration Examples](https://github.com/ankit-jn/terraform-aws-examples/tree/main/aws-cognito) for effectively utilizing this module.

### Inputs
---

##### User Pool

| Name | Description | Type | Default | Required | Example|
|:------|:------|:------|:------|:------:|:------|
| <a name="create_user_pool"></a> [create_user_pool](#input\_create\_user\_pool) | Flag to decide if create Cognito User Pool. | `bool` | `false` | no |  |
| <a name="user_pool_name"></a> [user_pool_name](#input\_user\_pool\_name) | Name of the User Pool. Required when `create_user_pool` is set true. | `string` | `null` | no |  |
| <a name="allow_only_admin_to_create_user_profile"></a> [allow_only_admin_to_create_user_profile](#input\_allow\_only\_admin\_to\_create\_user\_profile) | Flag to decide if only the administrator is allowed to create user profiles. | `bool` | `false` | no |  |
| <a name="invite_message_template"></a> [invite_message_template](#invite\_message\_template) | Configuration Map for Invite message template while creating user profile | `map(string)` | `{}` | no |  |
| <a name="verification_message_template"></a> [verification_message_template](#verification\_message\_template) | Verification Message Template Map | `map(string)` | `{}` | no |  |
| <a name="case_sensitive_username"></a> [case_sensitive_username](#input\_case\_sensitive\_username) | Flag to decide whether username case sensitivity will be applied for all users in the user pool through Cognito APIs. | `bool` | `true` | no |  |
| <a name="schemas"></a> [schemas](#schemas) | List of attributes map (with the following properties) of a User Pool | `any` | `[]` | no |  |
| <a name="username_attributes"></a> [username_attributes](#input\_username\_attributes) | The list of the attributes that can be specified as usernames when a user signs up. | `list(string)` | `[]` | no |  |
| <a name="alias_attributes"></a> [alias_attributes](#input\_alias\_attributes) | The list of the attributes supported as an alias for this user pool. | `list(string)` | `[]` | no |  |
| <a name="auto_verified_attributes"></a> [auto_verified_attributes](#input\_auto\_verified\_attributes) | The list of the attributes to be auto verified. | `list(string)` | `[]` | no |  |
| <a name="password_policy"></a> [password_policy](#password\_policy) | Password Policy Attribute Map | `map(any)` | `{}` | no |  |
| <a name="mfa_configuration"></a> [mfa_configuration](#input\_mfa\_configuration) | Multi-Factor Authentication (MFA) configuration for the User Pool. | `string` | `"OFF"` | no |  |
| <a name="advanced_security_mode"></a> [advanced_security_mode](#input\_advanced\_security\_mode) | Mode of Advanced Security. | `string` | `"OFF"` | no |  |
| <a name="lambda_config"></a> [lambda_config](#lambda\_config) | ARN of Lambda functions to trigger the different events. | `map(string)` | `{}` | no |  |
| <a name="recovery_mechanisms"></a> [recovery_mechanisms](#input\_recovery\_mechanisms) | Map of recovery mechanisms with each entry is having key as mechanism name and value as priority. | `map(number)` | `{}` | no |  |
| <a name="tags"></a> [tags](#input\_tags) | A map of tags to assign to the UserPool. | `map(string)` | `{}` | no |  |

##### User Pool Domain

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="domain_name"></a> [domain_name](#input\_domain\_name) | Either Fully-qualified domain name (for custom domain) or name used as prefix for Amazon Cognito domain. | `string` | `"auth"` | no |
| <a name="certificate_arn"></a> [certificate_arn](#input\_certificate\_arn) | The ARN of an ISSUED ACM certificate in us-east-1 for a custom domain. | `string` | `null` | no |

##### Resource Server

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="resource_servers"></a> [resource_servers](#resource_server) | List of resource server's configuration map | `any` | `[]` | no |

##### User Pool - Identity Providers

| Name | Description | Type | Default | Required | Example|
|:------|:------|:------|:------|:------:|:------|
| <a name="identity_providers"></a> [identity_providers](#identity_provider) | List of Identity providers of userPool where each entry will be a IDP configuration map | `any` | `[]` | no |

##### User Pool App Clients

| Name | Description | Type | Default | Required | Example|
|:------|:------|:------|:------|:------:|:------|
| <a name="client_follow_oauth_flows"></a> [client_follow_oauth_flows](#input\_client\_follow\_oauth\_flows) | Flag to decide if App clients are allowed to follow the OAuth protocol when interacting with Cognito user pools. | `bool` | `true` | no |  |
| <a name="client_allowed_oauth_flows"></a> [client_allowed_oauth_flows](#input\_client\_allowed\_oauth\_flows) | List of allowed OAuth flows (code, implicit, client_credentials). | `list(string)` | `null` | no |  |
| <a name="client_allowed_oauth_scopes"></a> [client_allowed_oauth_scopes](#input\_client\_allowed\_oauth\_scopes) | List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin). | `list(string)` | `null` | no |  |
| <a name="client_explicit_auth_flows"></a> [client_explicit_auth_flows](#input\_client\_explicit\_auth\_flows) | List of authentication flows. | `list(string)` | `null` | no |  |
| <a name="client_token_validity_units"></a> [client_token_validity_units](#token\_validity\_units) | Configuration Map for units in which the validity times are represented in. | `map(string)` | <pre>{<br>  access_token = "hours"<br>  id_token = "hours"<br>  refresh_token = "days"<br>} | no |  |
| <a name="client_token_validity"></a> [client_token_validity](#token\_validity) | Configuration Map of Time limits for all thr tokens after which tokens will no longer valid and cannot be used. | `map(number)` | <pre>{<br>  access_token_validity = 1<br>  id_token_validity = 1<br>  refresh_token_validity = 60<br>} | no |  |
| <a name="client_enable_token_revocation"></a> [client_enable_token_revocation](#input\_client\_enable\_token\_revocation) | Flag to decide whether enable token revocation. | `bool` | `false` | no |  |
| <a name="client_supported_identity_providers"></a> [client_supported_identity_providers](#input\_client\_supported\_identity\_providers) | List of provider names for the identity providers that are supported to the App clients. | `list(string)` | `null` | no |  |
| <a name="client_prevent_user_existence_errors"></a> [client_prevent_user_existence_errors](#input\_client\_prevent\_user\_existence\_errors) | Choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool. | `string` | `"ENABLED"` | no |  |
| <a name="client_enable_propagate_additional_user_context_data"></a> [client_enable_propagate_additional_user_context_data](#input\_client\_enable\_propagate\_additional\_user\_context\_data) | Activates the propagation of additional user context data. | `bool` | `false` | no |  |
| <a name="app_clients"></a> [app_clients](#app\_client) | List of App Clients of userPool where each entry will be a client configuration map | `any` | `[]` | no |  |

##### Identity Pool

| Name | Description | Type | Default | Required | Example|
|:------|:------|:------|:------|:------:|:------|
| <a name="create_identity_pool"></a> [create_identity_pool](#input\_create\_identity\_pool) | Flag to decide if create Cognito Identity Pool. | `bool` | `false` | no |  |
| <a name="identity_pool_name"></a> [identity_pool_name](#input\_identity\_pool\_name) | Name of the Identity Pool. Required when `create_identity_pool` is set true. | `string` | `null` | no |  |
| <a name="allow_unauthenticated_identities"></a> [allow_unauthenticated_identities](#input\_allow\_unauthenticated\_identities) | Flag to decide whether the identity pool supports unauthenticated logins or not. | `bool` | `false` | no |  |
| <a name="allow_classic_flow"></a> [allow_classic_flow](#input\_allow\_classic\_flow) | Flag to decide whether enables or disables the classic / basic authentication flow. | `bool` | `false` | no |  |
| <a name="cognito_identity_providers"></a> [cognito_identity_providers](#cognito\_identity\_providers) | A list of map for Amazon Cognito Identity user pools and their client IDs. | `list(map(any))` | `[]` | no |  |
| <a name="saml_providers"></a> [saml_providers](#input\_saml\_providers) | Flag to decide whether enables or disables the classic / basic authentication flow. | `list(string)` | `[]` | no |  |
| <a name="openid_connect_providers"></a> [openid_connect_providers](#input\_openid\_connect\_providers) | A list of OpendID Connect provider for your identity. | `list(string)` | `[]` | no |  |
| <a name="supported_login_providers"></a> [supported_login_providers](#input\_supported\_login\_providers) | Key-Value pairs mapping provider names to provider app IDs. | `map(string)` | `{}` | no |  |
| <a name="developer_provider_name"></a> [developer_provider_name](#input\_developer\_provider\_name) | The domain by which Cognito will refer to your users. | `string` | `null` | no |  |

### Nested Configuration Maps:  

#### invite_message_template

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="email_subject"></a> [email_subject](#input\_email\_subject) | Subject line for email messages. | `string` | `"Your verification code"` | no |
| <a name="email_message"></a> [email_message](#input\_email\_message) | Message template for email messages. | `string` | <pre>"{username}, your verification code is \`{####}\`" | no |
| <a name="sms_message"></a> [sms_message](#input\_sms\_message) | Message template for SMS messages. | `string` | <pre>"Your username is {username} and temporary password is \`{####}\`" | no |

#### verification_message_template

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="default_email_option"></a> [default_email_option](#input\_default\_email\_option) | Default email option. | `string` | `"CONFIRM_WITH_CODE"` | no |
| <a name="email_subject"></a> [email_subject](#input\_email\_subject) | String representing the email verification subject. | `string` | `"Your verification code"` | no |
| <a name="email_message"></a> [email_message](#input\_email\_message) | String representing the email verification message. | `string` | <pre>"{username}, your verification code is \`{####}\`" | no |
| <a name="email_subject_by_link"></a> [email_subject_by_link](#input\_email\_subject\_by\_link) | Subject line for the email message template for sending a confirmation link to the user. | `string` | `"Your verification link"` | no |
| <a name="email_message_by_link"></a> [email_message_by_link](#input\_email\_message\_by\_link) | Email message template for sending a confirmation link to the user, it must contain the {##Click Here##}. | `string` | <pre>"Please click the link below to verify your email address. {##Verify Email##}" | no |
| <a name="sms_message"></a> [sms_message](#input\_sms\_message) | String representing the SMS verification message. | `string` | <pre>"Your username is {username} and temporary password is \`{####}\`" | no |

#### schemas

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="name"></a> [name](#input\_name) | Name of the attribute. | `string` |  | yes |
| <a name="required"></a> [required](#input\_required) | Whether a user pool attribute is required. | `bool` | `false` | no |
| <a name="attribute_data_type"></a> [attribute_data_type](#input\_attribute\_data\_type) | Attribute data type. Must be one of Boolean, Number, String, DateTime. | `string` |  | yes |
| <a name="developer_only_attribute"></a> [developer_only_attribute](#input\_developer\_only\_attribute) | Whether the attribute type is developer only. | `bool` | `false` | no |
| <a name="mutable"></a> [mutable](#input\_mutable) | Whether the attribute can be changed once it has been created. | `bool` | `true` | no |
| <a name="min_length"></a> [min_length](#input\_min\_length) | Minimum length of an attribute value of the string type. | `number` | `0` | no |
| <a name="max_length"></a> [max_length](#input\_max\_length) | Maximum length of an attribute value of the string type. | `number` | `2048` | no |
| <a name="min_value"></a> [min_value](#input\_min\_value) | Minimum value of an attribute that is of the number data type. | `number` | `0` | no |
| <a name="max_value"></a> [max_value](#input\_max\_value) | Maximum value of an attribute that is of the number data type. | `number` | `2048` | no |

#### password_policy

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="minimum_length"></a> [minimum_length](#input\_minimum\_length) | Minimum length of the password policy to set. | `number` | `8` | no |
| <a name="require_lowercase"></a> [require_lowercase](#input\_require\_lowercase) | Whether to use at least one lowercase letter in the password. | `bool` | `true` | no |
| <a name="require_uppercase"></a> [require_uppercase](#input\_require\_uppercase) | Whether to use at least one uppercase letter in the password. | `bool` | `true` | no |
| <a name="require_numbers"></a> [require_numbers](#input\_require\_numbers) | Whether to use at least one number in the password. | `bool` | `true` | no |
| <a name="require_symbols"></a> [require_symbols](#input\_require\_symbols) | Whether to use at least one symbol in the password. | `bool` | `true` | no |
| <a name="temporary_password_validity_days"></a> [temporary_password_validity_days](#input\_temporary\_password\_validity\_days) | The number of days a temporary password is valid. | `number` | `7` | no |

#### lambda_config

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="create_auth_challenge"></a> [create_auth_challenge](#input\_create\_auth\_challenge) | ARN of the lambda creating an authentication challenge. | `string` | `null` | no |
| <a name="custom_message"></a> [custom_message](#input\_custom\_message) | Custom Message AWS Lambda trigger. | `string` | `null` | no |
| <a name="define_auth_challenge"></a> [define_auth_challenge](#input\_define\_auth\_challenge) | Defines the authentication challenge. | `string` | `null` | no |
| <a name="post_authentication"></a> [post_authentication](#input\_post\_authentication) | Post-authentication AWS Lambda trigger. | `string` | `null` | no |
| <a name="post_confirmation"></a> [post_confirmation](#input\_post\_confirmation) | Post-confirmation AWS Lambda trigger. | `string` | `null` | no |
| <a name="pre_authentication"></a> [pre_authentication](#input\_pre\_authentication) | Pre-authentication AWS Lambda trigger. | `string` | `null` | no |
| <a name="pre_sign_up"></a> [pre_sign_up](#input\_pre\_sign\_up) | Pre-registration AWS Lambda trigger. | `string` | `null` | no |
| <a name="pre_token_generation"></a> [pre_token_generation](#input\_pre\_token\_generation) | Allow to customize identity token claims before token generation. | `string` | `null` | no |
| <a name="user_migration"></a> [user_migration](#input\_user\_migration) | User migration Lambda config type. | `string` | `null` | no |
| <a name="verify_auth_challenge_response"></a> [verify_auth_challenge_response](#input\_verify\_auth\_challenge\_response) | Verifies the authentication challenge response. | `string` | `null` | no |

#### token_validity_units

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="access_token"></a> [access_token](#input\_access\_token) | Time unit in for the value in access_token_validity for app client. | `string` | `"hours"` | no |
| <a name="id_token"></a> [id_token](#input\_id\_token) | Time unit in for the value in id_token_validity for app client. | `string` | `"hours"` | no |
| <a name="refresh_token"></a> [refresh_token](#input\_refresh\_token) | Time unit in for the value in refresh_token_validity for app client | `string` | `"days"` | no |

#### token_validity

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="access_token"></a> [access_token](#input\_access\_token) |  Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used. | `number` | `1` | no |
| <a name="id_token"></a> [id_token](#input\_id\_token) | Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used. | `number` | `1` | no |
| <a name="refresh_token"></a> [refresh_token](#input\_refresh\_token) | Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used. | `number` | `60` | no |

#### resource_server

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="identifier"></a> [identifier](#input\_identifier) | An identifier for the resource server. | `string` |  | yes |
| <a name="name"></a> [name](#input\_name) | A name for the resource server. | `string` |  | yes |
| <a name="scopes"></a> [scopes](#authorization_scope) | A list of Authorization Scope map. | `list(string)` | `[]` | no |

#### identity_provider

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="provider_name"></a> [provider_name](#input\_provider\_name) | The provider name. | `string` |  | yes |
| <a name="provider_type"></a> [provider_type](#input\_provider\_type) | The provider type. | `string` |  | yes |
| <a name="provider_details"></a> [provider_details](#provider\_details) | The map of provider details. | `map(string)` |  | yes |
| <a name="idp_identifiers"></a> [idp_identifiers](#input\_idp\_identifiers) | The list of identity providers. | `list(string)` |  | no |
| <a name="attribute_mapping"></a> [attribute_mapping](#input\_attribute\_mapping) | The map of attribute mapping of user pool attributes. | `map(string)` |  | no |

#### provider_details

##### IDP: `Google`
| Name | Type | Required |
|:------|:------|:------:|
| <a name="client_id"></a> [client_id](#input\_client\_id) | `string` | yes |
| <a name="client_secret"></a> [client_secret](#input\_client\_secret) | `string` | yes |
| <a name="authorize_scopes"></a> [authorize_scopes](#input\_authorize\_scopes) | `string` | yes |
| <a name="oidc_issuer"></a> [oidc_issuer](#input\_oidc\_issuer) | `string` | yes |
| <a name="authorize_url"></a> [authorize_url](#input\_authorize\_url) | `string` | yes |
| <a name="token_url"></a> [token_url](#input\_token\_url) | `string` | yes |
| <a name="token_request_method"></a> [token_request_method](#input\_token\_request\_method) | `string` | yes |
| <a name="attributes_url"></a> [attributes_url](#input\_attributes\_url) | `string` | yes |
| <a name="attributes_url_add_attributes"></a> [attributes_url_add_attributes](#input\_attributes\_url\_add\_attributes) | `bool` | yes |

oidc_issuer

##### IDP: `LoginWithAmazon`
| Name | Type | Required |
|:------|:------|:------:|
| <a name="client_id"></a> [client_id](#input\_client\_id) | `string` | yes |
| <a name="client_secret"></a> [client_secret](#input\_client\_secret) | `string` | yes |
| <a name="authorize_scopes"></a> [authorize_scopes](#input\_authorize\_scopes) | `string` | yes |
| <a name="authorize_url"></a> [authorize_url](#input\_authorize\_url) | `string` | yes |
| <a name="token_url"></a> [token_url](#input\_token\_url) | `string` | yes |
| <a name="token_request_method"></a> [token_request_method](#input\_token\_request\_method) | `string` | yes |
| <a name="attributes_url"></a> [attributes_url](#input\_attributes\_url) | `string` | yes |
| <a name="attributes_url_add_attributes"></a> [attributes_url_add_attributes](#input\_attributes\_url\_add\_attributes) | `bool` | yes |

##### IDP: `Facebook`
| Name | Type | Required |
|:------|:------|:------:|
| <a name="client_id"></a> [client_id](#input\_client\_id) | `string` | yes |
| <a name="client_secret"></a> [client_secret](#input\_client\_secret) | `string` | yes |
| <a name="authorize_scopes"></a> [authorize_scopes](#input\_authorize\_scopes) | `string` | yes |
| <a name="authorize_url"></a> [authorize_url](#input\_authorize\_url) | `string` | yes |
| <a name="token_url"></a> [token_url](#input\_token\_url) | `string` | yes |
| <a name="token_request_method"></a> [token_request_method](#input\_token\_request\_method) | `string` | yes |
| <a name="attributes_url"></a> [attributes_url](#input\_attributes\_url) | `string` | yes |
| <a name="attributes_url_add_attributes"></a> [attributes_url_add_attributes](#input\_attributes\_url\_add\_attributes) | `bool` | yes |

##### IDP: `SignInWithApple`
| Name | Type | Required |
|:------|:------|:------:|
| <a name="client_id"></a> [client_id](#input\_client\_id) | `string` | yes |
| <a name="team_id"></a> [team_id](#input\_team\_id) | `string` | yes |
| <a name="key_id"></a> [key_id](#input\_key\_id) | `string` | yes |
| <a name="private_key"></a> [private_key](#input\_private\_key) | `string` | yes |
| <a name="authorize_scopes"></a> [authorize_scopes](#input\_authorize\_scopes) | `string` | yes |

##### IDP: `OIDC`
| Name | Type | Required |
|:------|:------|:------:|
| <a name="client_id"></a> [client_id](#input\_client\_id) | `string` | yes |
| <a name="client_secret"></a> [client_secret](#input\_client\_secret) | `string` | no |
| <a name="authorize_scopes"></a> [authorize_scopes](#input\_authorize\_scopes) | `string` | yes |
| <a name="oidc_issuer"></a> [oidc_issuer](#input\_oidc\_issuer) | `string` | yes |
| <a name="attributes_request_method"></a> [attributes_request_method](#input\_attributes\_request\_method) | `string` | yes |
| <a name="attributes_url_add_attributes"></a> [attributes_url_add_attributes](#input\_attributes\_url\_add\_attributes) | `bool` | no |

##### IDP: `SAML`
- Either `MetadataFile` or `MetadataURL` is required.

| Name | Type | Required |
|:------|:------|:------:|
| <a name="MetadataFile"></a> [MetadataFile](#input\_MetadataFile) | `string` | yes |
| <a name="MetadataURL"></a> [MetadataURL](#input\_MetadataURL) | `string` | yes |
| <a name="IDPSignout"></a> [IDPSignout](#input\_client\_secret) | `string` | no |

#### authorization_scope

- Authorization Scope for Cognito Resource Server

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="name"></a> [name](#input\_name) | The scope name. | `string` |  | yes |
| <a name="description"></a> [description](#input\_description) | The scope description. | `string` |  | yes |

#### cognito_identity_providers

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="client_id"></a> [client_id](#input\_client\_id) | The client ID for the Amazon Cognito Identity User Pool. | `string` |  | yes |
| <a name="provider_name"></a> [provider_name](#input\_provider\_name) | The endpoint for an Amazon Cognito Identity User Pool. | `string` |  | yes |
| <a name="server_side_token_check"></a> [server_side_token_check](#input\_server\_side\_token\_check) | Flag to decide whether server-side token validation is enabled for the identity provider’s token or not. | `bool` | `false` | no |

#### app_client

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="name"></a> [name](#input\_name) | Name of the application client. | `string` |  | yes |
| <a name="follow_oauth_flows"></a> [follow_oauth_flows](#input\_follow\_oauth\_flows) | Flag to decide if App client is allowed to follow Oauth Protocol. (Override `client_follow_oauth_flows`) | `bool` |  | no |
| <a name="allowed_oauth_flows"></a> [allowed_oauth_flows](#input\_allowed\_oauth\_flows) | List of allowed OAuth flows. (Override `client_allowed_oauth_flows`) | `list(string)` |  | no |
| <a name="allowed_oauth_scopes"></a> [allowed_oauth_scopes](#input\_allowed\_oauth\_scopes) | List of allowed OAuth scopes. (Override `client_allowed_oauth_scopes`) | `list(string)` |  | no |
| <a name="explicit_auth_flows"></a> [explicit_auth_flows](#input\_explicit\_auth\_flows) | List of authentication flows. | `list(string)` |  | no |
| <a name="token_validity_units"></a> [token_validity_units](#input\_token\_validity\_units) | Token's Validity Units Configuration Map. (Override `client_token_validity_units`) | `map(string)` |  | no |
| <a name="token_validity"></a> [token_validity](#input\_token\_validity) | Token's Validity Configuration Map. (Override `client_token_validity`) | `map(number)` |  | no |
| <a name="enable_token_revocation"></a> [enable_token_revocation](#input\_enable\_token\_revocation) | Flag to decide whether enable token revocation. | `bool` |  | no |
| <a name="generate_secret"></a> [generate_secret](#input\_generate\_secret) | Should an application secret be generated. | `bool` | `true` | no |
| <a name="callback_urls"></a> [callback_urls](#input\_callback\_urls) | List of allowed callback URLs for the identity providers. | `list(string)` | `null` | no |
| <a name="logout_urls"></a> [logout_urls](#input\_logout\_urls) | List of allowed logout URLs for the identity providers. | `list(string)` | `null` | no |
| <a name="default_redirect_uri"></a> [default_redirect_uri](#input\_default\_redirect\_uri) | Default redirect URI. Must be in the list of callback URLs. | `string` | `null` | no |
| <a name="read_attributes"></a> [read_attributes](#input\_read\_attributes) | List of user pool attributes the application client can read from. | `list(string)` | `null` | no |
| <a name="write_attributes"></a> [write_attributes](#input\_write\_attributes) | List of user pool attributes the application client can write to. | `list(string)` | `null` | no |
| <a name="supported_identity_providers"></a> [supported_identity_providers](#input\_supported\_identity\_providers) | List of provider names for the identity providers that are supported on this client. | `list(string)` |  | no |
| <a name="enable_propagate_additional_user_context_data"></a> [enable_propagate_additional_user_context_data](#input\_enable\_propagate\_additional\_user\_context\_data) | Activates the propagation of additional user context data. | `bool` |  | no |
| <a name="prevent_user_existence_errors"></a> [prevent_user_existence_errors](#input\_prevent\_user\_existence\_errors) | Choose which errors and responses are returned by Cognito APIs during authentication, account confirmation, and password recovery when the user does not exist in the user pool. | `string` | `"ENABLED"` | no |

### Outputs

| Name | Type | Description |
|:------|:------|:------|
| <a name="user_pool_id"></a> [user_pool_id](#output\_user\_pool\_id) | `string` | ID of the user pool. |
| <a name="user_pool_arn"></a> [user_pool_arn](#output\_user\_pool\_arn) | `string` | ARN of the user pool. |
| <a name="user_pool_endpoint"></a> [user_pool_endpoint](#output\_user\_pool\_endpoint) | `string` | Endpoint name of the user pool. |
| <a name="user_pool_domain"></a> [user_pool_domain](#output\_user\_pool\_domain) | `string` | Holds the domain prefix if the user pool has a domain associated with it. |
| <a name="user_pool_custom_domain"></a> [user_pool_custom_domain](#output\_user\_pool\_custom\_domain) | `string` | A custom domain name that is provided to Amazon Cognito. |
| <a name="user_pool_domain_aws_account_id"></a> [user_pool_domain_aws_account_id](#output\_user\_pool\_domain\_aws\_account\_id) | `string` | The AWS account ID for the user pool owner. |
| <a name="user_pool_domain_cdn_arn"></a> [user_pool_domain_cdn_arn](#output\_user\_pool\_domain\_cdn\_arn) | `string` | The URL of the CloudFront distribution. |
| <a name="user_pool_domain_s3_bucket"></a> [user_pool_domain_s3_bucket](#output\_user\_pool\_domain\_s3\_bucket) | `string` | The S3 bucket where the static files for this domain are stored. |
| <a name="user_pool_domain_app_version"></a> [user_pool_domain_app_version](#output\_user\_pool\_domain\_app\_version) | `string` | The app version. |
| <a name="user_pool_app_client_ids"></a> [user_pool_app_client_ids](#output\_user\_pool\_app\_client\_ids) | `map(string)` | The map of App client IDs Key Pair `App Client Name: App Client Id>` |
| <a name="identity_pool_id"></a> [identity_pool_id](#output\_identity\_pool\_id) | `string` | ID of the identity pool. |
| <a name="identity_pool_arn"></a> [identity_pool_arn](#output\_identity\_pool\_arn) | `string` | ARN of the identity pool. |

### Authors

Module is maintained by [Ankit Jain](https://github.com/ankit-jn) with help from [these professional](https://github.com/ankit-jn/terraform-aws-cognito/graphs/contributors).
