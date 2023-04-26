module "boundary_cluster_hq_provider" {

  source = "./modules/sub-modules/boundary_worker_module/"

  random_id = random_pet.env.id

  region                                = var.clusters.us.region
  vpc_cidr                              = var.clusters.us.vpc_cidr
  boundary_version                      = var.boundary_version
  boundary_ec2_type                     = var.boundary_ec2_type
  hcp_boundary_cluster_id               = trimprefix(trimsuffix("${var.addr}", ".boundary.hashicorp.cloud"), "https://")
  controller_generated_activation_token = module.hcp_boundary_cluster.worker_tokens.us.controller_generated_activation_token

  providers = {
    aws = aws.hq_provider
  }
  depends_on = [module.vault-cluster-ap, module.vault-cluster-eu, module.vault-cluster-us, module.inter_vpc_peering]
}

module "boundary_cluster_pr_provider" {

  source = "./modules/sub-modules/boundary_worker_module/"

  random_id = random_pet.env.id

  region                                = var.clusters.ap.region
  vpc_cidr                              = var.clusters.ap.vpc_cidr
  boundary_version                      = var.boundary_version
  hcp_boundary_cluster_id               = trimprefix(trimsuffix("${var.addr}", ".boundary.hashicorp.cloud"), "https://")
  controller_generated_activation_token = module.hcp_boundary_cluster.worker_tokens.ap.controller_generated_activation_token

  providers = {
    aws = aws.pr_provider
  }
  depends_on = [module.vault-cluster-ap, module.vault-cluster-eu, module.vault-cluster-us, module.inter_vpc_peering]
}

module "boundary_cluster_dr_provider" {

  source = "./modules/sub-modules/boundary_worker_module/"

  random_id = random_pet.env.id

  region                                = var.clusters.eu.region
  vpc_cidr                              = var.clusters.eu.vpc_cidr
  boundary_version                      = var.boundary_version
  boundary_ec2_type                     = var.boundary_ec2_type
  hcp_boundary_cluster_id               = trimprefix(trimsuffix("${var.addr}", ".boundary.hashicorp.cloud"), "https://")
  controller_generated_activation_token = module.hcp_boundary_cluster.worker_tokens.eu.controller_generated_activation_token

  providers = {
    aws = aws.dr_provider
  }
  depends_on = [module.vault-cluster-ap, module.vault-cluster-eu, module.vault-cluster-us, module.inter_vpc_peering]
}