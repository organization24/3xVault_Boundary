output "current-env-id" {
  value       = random_pet.env.id
  description = "Outputs the random ID used for particular deployment of the environment, useful for enabling S3 snapshots"
}

#output "vault-cluster-us-public-ips" {
#  value       = [for node in module.vault-cluster-us.vault-instance-public-ips : format("Name: %s - Public IP: %s", node.tags.Name, node.public_ip)]
#  description = "Prints public IPs for the nodes in the US cluster"
#}
#
#output "vault-cluster-eu-public-ips" {
#  value       = [for node in module.vault-cluster-eu.vault-instance-public-ips : format("Name: %s - Public IP: %s", node.tags.Name, node.public_ip)]
#  description = "Prints public IPs for the nodes in the EU cluster"
#}
#
#output "vault-cluster-ap-public-ips" {
#  value       = [for node in module.vault-cluster-ap.vault-instance-public-ips : format("Name: %s - Public IP: %s", node.tags.Name, node.public_ip)]
#  description = "Prints public IPs for the nodes in the AP cluster"
#}

output "boundary-us-public-ip" {
  value       = module.boundary_cluster_hq_provider.boundary-instance-public-ip.public_ip
  description = "Prints public IP for Boundary worker in the US (HQ) cluster"
}


output "boundary-eu-public-ip" {
  value       = module.boundary_cluster_dr_provider.boundary-instance-public-ip.public_ip
  description = "Prints public IP for Boundary worker in the EU (DR) cluster"
}

output "boundary-ap-public-ip" {
  value       = module.boundary_cluster_pr_provider.boundary-instance-public-ip.public_ip
  description = "Prints public IP for Boundary worker in the AP (PR) cluster"
}

output "login_us" {
  value = "boundary authenticate password -scope-id=${module.hcp_boundary_cluster.org_id_aws} -auth-method-id=${module.hcp_boundary_cluster.auth_method_id} -login-name=administrator-us"
}

output "login_eu" {
  value = "boundary authenticate password -scope-id=${module.hcp_boundary_cluster.org_id_aws} -auth-method-id=${module.hcp_boundary_cluster.auth_method_id} -login-name=administrator-eu"
}

output "login_ap" {
  value = "boundary authenticate password -scope-id=${module.hcp_boundary_cluster.org_id_aws} -auth-method-id=${module.hcp_boundary_cluster.auth_method_id} -login-name=administrator-ap"
}

output "vault_ssh_target_us" {
  value = "boundary connect ssh -target-scope-name=3xVaultProject -target-name=targetUSregion"
}

output "vault_ssh_target_eu" {
  value = "boundary connect ssh -target-scope-name=3xVaultProject -target-name=targetEUregion"
}

output "vault_ssh_target_ap" {
  value = "boundary connect ssh -target-scope-name=3xVaultProject -target-name=targetAPregion"
}