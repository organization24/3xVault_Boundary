#### GENERATING KEYS FOR SERVERS

# Generating private key for all servers 
resource "tls_private_key" "vault_tls_rsa_key" {
  for_each  = local.availability_zones_sliced
  algorithm = "RSA"
}

resource "tls_cert_request" "csr_vault_server" {
  for_each = local.availability_zones_sliced

  #key_algorithm   = "RSA" │ This is now ignored, as the key algorithm is inferred from the `private_key_pem`.
  private_key_pem = tls_private_key.vault_tls_rsa_key[each.key].private_key_pem

  subject {
    common_name  = "vault-${var.region}-${each.key}-${var.random_id}" # Just a name, the real names and adresses are in SANs
    organization = "Vault setup"
  }

  ip_addresses = [
    "${cidrhost(data.aws_subnet.subnets[each.key].cidr_block, 5)}", # Private IP of EC2, it is always the 5th IP in the subnet
    "127.0.0.1",
  ]

  dns_names = [
    "localhost",
    "vault-${var.region}-${each.key}-${var.random_id}"
  ]
}

# Singing each of the generated certs with the CA
resource "tls_locally_signed_cert" "vault_cert_sign" {
  for_each = local.availability_zones_sliced

  cert_request_pem = tls_cert_request.csr_vault_server[each.key].cert_request_pem # Provide the CSR
  #ca_key_algorithm   = "RSA" │ This is now ignored, as the key algorithm is inferred from the `ca_private_key_pem`.
  ca_private_key_pem = var.vault_common_ca_private_key # CA private key
  ca_cert_pem        = var.vault_common_ca_cert        # CA cert

  validity_period_hours = 3600

  allowed_uses = [ # Important, what the cert can be used for
    "digital_signature",
    "key_encipherment",
    "key_agreement"
  ]

  is_ca_certificate = false # It is not CA
}