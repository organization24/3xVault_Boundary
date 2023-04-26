output "vault-instance-public-ips" {
  value = module.vault-cluster-ap.vault-instance-public-ips
}

output "ssh_private_key" {
  value = module.vault-cluster-ap.ssh_private_key
}