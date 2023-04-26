# Creates 3 targets for each of the regions
resource "boundary_target" "target_US" {
  name                 = "targetUSregion"
  description          = "Target which is used for connecting to US region"
  type                 = "ssh"
  default_port         = "22"
  scope_id             = boundary_scope.project.id
  egress_worker_filter = "\"vault-${var.clusters.us.region}-${var.random_id}\" in \"/tags/hostname\""
  host_source_ids = [
    boundary_host_set_static.region1_host_set.id
  ]
  injected_application_credential_source_ids = [
    boundary_credential_ssh_private_key.ssh_key_us.id
  ]
}

resource "boundary_target" "target_EU" {
  name                 = "targetEUregion"
  description          = "Target which is used for connecting to EU region"
  type                 = "ssh"
  default_port         = "22"
  scope_id             = boundary_scope.project.id
  egress_worker_filter = "\"vault-${var.clusters.eu.region}-${var.random_id}\" in \"/tags/hostname\""
  host_source_ids = [
    boundary_host_set_static.region2_host_set.id
  ]
  injected_application_credential_source_ids = [
    boundary_credential_ssh_private_key.ssh_key_eu.id
  ]
}

resource "boundary_target" "target_AP" {
  name                 = "targetAPregion"
  description          = "Target which is used for connecting to AP region"
  type                 = "ssh"
  default_port         = "22"
  scope_id             = boundary_scope.project.id
  egress_worker_filter = "\"vault-${var.clusters.ap.region}-${var.random_id}\" in \"/tags/hostname\""
  host_source_ids = [
    boundary_host_set_static.region3_host_set.id
  ]
  injected_application_credential_source_ids = [
    boundary_credential_ssh_private_key.ssh_key_ap.id
  ]
}
