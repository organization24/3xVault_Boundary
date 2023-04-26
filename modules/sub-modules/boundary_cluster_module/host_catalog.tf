# Creates host catalog which contains all hosts for all regions
resource "boundary_host_catalog_static" "host_catalog" {
  name        = "3xVaultHostCatalog"
  description = "Host catalog which contains all hosts from all regions from the 3xVault repo"
  #type        = "static"
  scope_id = boundary_scope.project.id
}