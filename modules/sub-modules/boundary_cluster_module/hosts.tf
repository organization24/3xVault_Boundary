# Define hosts fror each region
resource "boundary_host_static" "region1_hosts" {
  for_each = var.region1_addresses

  type            = "static"
  name            = each.key
  description     = each.key
  address         = each.value
  host_catalog_id = boundary_host_catalog_static.host_catalog.id
}

resource "boundary_host_static" "region2_hosts" {
  for_each = var.region2_addresses

  type            = "static"
  name            = each.key
  description     = each.key
  address         = each.value
  host_catalog_id = boundary_host_catalog_static.host_catalog.id
}

resource "boundary_host_static" "region3_hosts" {
  for_each = var.region3_addresses

  type            = "static"
  name            = each.key
  description     = each.key
  address         = each.value
  host_catalog_id = boundary_host_catalog_static.host_catalog.id
}