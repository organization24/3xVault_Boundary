output "vault-instance-public-ips" {
  value = module.vault-cluster-us.vault-instance-public-ips
}

output "ssh_private_key" {
  value = module.vault-cluster-us.ssh_private_key
}