# Project which contains all resources
resource "boundary_scope" "project" {
  name                   = "3xVaultProject"
  description            = "Project which contains resource for connecting to 3xVault repo"
  scope_id               = boundary_scope.aws_org.id
  auto_create_admin_role = true
}