resource aws_cognito_resource_server "this" {
    for_each = { for resource_server in var.resource_servers: 
                        resource_server.name => resource_server }

    user_pool_id = aws_cognito_user_pool.this.id

    name = each.key
    identifier = each.value.identitifier

    ## Authorization Scope
    dynamic "scope" {
        for_each = lookup(each.value, "scopes", [])

        content {
            scope_name        = lookup(scope.value, "name")
            scope_description = lookup(scope.value, "description")
        }
    }
}