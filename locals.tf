locals {
  # Deployment is using the random_pet for tagging resourcres
  random_id = random_pet.env.id
  # Putting the CA cert in a local variable
  vault_common_ca_cert = module.vault_common_ca.vault_common_ca_cert
  # Putting the CA key in a local variable
  vault_common_ca_private_key = module.vault_common_ca.common_ca_private_key
  # Use empty license if the license file `license_vault.txt` does not exists
  empty_license = ""
  # Reading Vault license file, if it does not exists, OSS Vault will be used 
  vault_license = fileexists("${path.root}/license_vault.txt") ? file("${path.root}/license_vault.txt") : local.empty_license
  # Getting the fitfh IP address from every /28 subnet of the specified VPC CIDR, for example: VPC CIDR: 192.168.100.0/24", the \28 subnets are "192.168.100.0/28" "192.168.100.16/28" , "192.168.100.32/28" and so on
  # Example result:
  # {for index in [5,21,37] : "3xVaultUS${index([5,21,37],index)}" => cidrhost("192.168.100.0/24",index)}
  # {
  # "3xVaultUS0" = "192.168.100.5"
  # "3xVaultUS1" = "192.168.100.21"
  # "3xVaultUS2" = "192.168.100.37"
  # }
  host_trailing_ip_numbers = [5, 21, 37]
  region1_addresses        = { for index in local.host_trailing_ip_numbers : "3xVaultUS${index(local.host_trailing_ip_numbers, index)}" => cidrhost(var.clusters.us.vpc_cidr, index) }

  region2_addresses = { for index in local.host_trailing_ip_numbers : "3xVaultEU${index(local.host_trailing_ip_numbers, index)}" => cidrhost(var.clusters.eu.vpc_cidr, index) }

  region3_addresses = { for index in local.host_trailing_ip_numbers : "3xVaultAP${index(local.host_trailing_ip_numbers, index)}" => cidrhost(var.clusters.ap.vpc_cidr, index) }
}