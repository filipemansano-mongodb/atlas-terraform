resource "mongodbatlas_database_user" "test" {
  username           = var.username
  password           = var.password
  project_id         = var.project_id
  auth_database_name = var.auth_database_name

  dynamic "roles" {
    for_each = var.roles
    content {
      role_name     = roles.value.role_name
      database_name = roles.value.database_name
    }
  }

  lifecycle {
    ignore_changes = [
      password,
    ]
  }
}