module "hcp_boundary_cluster" {

  source = "./modules/sub-modules/boundary_cluster_module"

  random_id = random_pet.env.id

  region1_addresses = local.region1_addresses
  region2_addresses = local.region2_addresses
  region3_addresses = local.region3_addresses

  private_key_us = module.vault-cluster-us.ssh_private_key
  private_key_eu = module.vault-cluster-eu.ssh_private_key
  private_key_ap = module.vault-cluster-ap.ssh_private_key

  administratorUS_password = var.administratorUS_password
  administratorEU_password = var.administratorEU_password
  administratorAP_password = var.administratorAP_password

  clusters = var.clusters

  providers = {
    boundary = boundary.hcp_boundary
  }
  depends_on = [module.vault-cluster-ap, module.vault-cluster-eu, module.vault-cluster-us, module.inter_vpc_peering]
}