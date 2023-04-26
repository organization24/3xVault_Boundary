provider "aws" {
  region = var.clusters.us.region
  alias  = "hq_provider"
}

provider "aws" {
  region = var.clusters.eu.region
  alias  = "dr_provider"
}

provider "aws" {
  region = var.clusters.ap.region
  alias  = "pr_provider"
}

provider "boundary" {
  alias                           = "hcp_boundary"
  addr                            = var.addr
  auth_method_id                  = var.auth_method_id
  password_auth_method_password   = var.password_auth_method_password
  password_auth_method_login_name = var.password_auth_method_login_name
}