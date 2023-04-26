data "cloudinit_config" "boundary_host" {

  gzip          = true
  base64_encode = true
  # This part is for setting hostname adds Hashicorp repo and installs Vault
  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/templates/cloud_init_templates/cloud-config-boundary-worker.yml", {
      hostname        = "boundary-${var.region}-${var.random_id}",
      timezone        = "Europe/Sofia" # Non configurable for now,
      boudary_version = var.boundary_version

    })
  }
  part {
    content_type = "text/x-shellscript"
    content = templatefile("${path.module}/templates/cloud_init_templates/boundary_config_file.tmpl", {
      hostname                              = "vault-${var.region}-${var.random_id}",
      hcp_boundary_cluster_id               = var.hcp_boundary_cluster_id,
      controller_generated_activation_token = var.controller_generated_activation_token
    })
  }
}