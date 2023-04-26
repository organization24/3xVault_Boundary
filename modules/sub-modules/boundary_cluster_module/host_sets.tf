# Creates hosts sets from each region
resource "boundary_host_set_static" "region1_host_set" {
  name            = "HostSetUS"
  host_catalog_id = boundary_host_catalog_static.host_catalog.id
  host_ids        = [for host in boundary_host_static.region1_hosts : host.id]
}

resource "boundary_host_set_static" "region2_host_set" {
  name            = "HostSetEU"
  host_catalog_id = boundary_host_catalog_static.host_catalog.id
  host_ids        = [for host in boundary_host_static.region2_hosts : host.id]
}

resource "boundary_host_set_static" "region3_host_set" {
  name            = "HostSetAP"
  host_catalog_id = boundary_host_catalog_static.host_catalog.id
  host_ids        = [for host in boundary_host_static.region3_hosts : host.id]
}