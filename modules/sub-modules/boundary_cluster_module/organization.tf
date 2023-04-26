# Organization that is child of global
resource "boundary_scope" "aws_org" {
  name        = "AWS"
  description = "Organization which contains AWS resources"
  #global_scope             = true # Create the org in the global scope
  scope_id                 = "global"
  auto_create_admin_role   = true
  auto_create_default_role = true
}