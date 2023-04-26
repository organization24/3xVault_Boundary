# Creates accounts in administative_auth authentication method

resource "boundary_account_password" "administratorUS" {
  auth_method_id = boundary_auth_method.administative_auth.id
  type           = "password"
  login_name     = "administrator-us"
  password       = var.administratorUS_password
}

resource "boundary_account_password" "administratorEU" {
  auth_method_id = boundary_auth_method.administative_auth.id
  type           = "password"
  login_name     = "administrator-eu"
  password       = var.administratorEU_password
}

resource "boundary_account_password" "administratorAP" {
  auth_method_id = boundary_auth_method.administative_auth.id
  type           = "password"
  login_name     = "administrator-ap"
  password       = var.administratorAP_password
}