output "vault-instance-public-ips" {
  value = module.vault-cluster-eu.vault-instance-public-ips
}

output "ssh_private_key" {
  value = module.vault-cluster-eu.ssh_private_key
}