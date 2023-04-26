# Static credentials for SSH (SSH private keys)
resource "boundary_credential_store_static" "creds_store" {
  name        = "3xVaultCreds"
  description = "Creds store which contains SSH private keys for 3xVault project"
  scope_id    = boundary_scope.project.id
}

resource "boundary_credential_ssh_private_key" "ssh_key_us" {
  name                = "ssh_key_us"
  description         = "SSH private keys for US region"
  credential_store_id = boundary_credential_store_static.creds_store.id
  username            = var.instance_login_name
  private_key         = var.private_key_us

}

resource "boundary_credential_ssh_private_key" "ssh_key_eu" {
  name                = "ssh_key_eu"
  description         = "SSH private keys for EU region"
  credential_store_id = boundary_credential_store_static.creds_store.id
  username            = var.instance_login_name
  private_key         = var.private_key_eu

}

resource "boundary_credential_ssh_private_key" "ssh_key_ap" {
  name                = "ssh_key_ap"
  description         = "SSH private keys for AP region"
  credential_store_id = boundary_credential_store_static.creds_store.id
  username            = var.instance_login_name
  private_key         = var.private_key_ap

}