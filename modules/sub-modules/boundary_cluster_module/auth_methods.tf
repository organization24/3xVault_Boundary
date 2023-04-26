# Creates a auth methods to be used by regular users in regards to Boundary
resource "boundary_auth_method" "administative_auth" {
  name        = "administrative_auth"
  scope_id    = boundary_scope.aws_org.id
  type        = "password"
  description = "Auth method to be used by users for administering US, EU and AP regions"
  min_login_name_length = 1
  min_password_length = 1
}