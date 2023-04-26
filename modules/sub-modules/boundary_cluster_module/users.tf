# Users for administrators of each region

resource "boundary_user" "administratorUS" {
  name        = "administrator-us"
  description = "administrator-us user"
  account_ids = [boundary_account_password.administratorUS.id]
  scope_id    = boundary_scope.aws_org.id
}

resource "boundary_user" "administratorEU" {
  name        = "administrator-eu"
  description = "administrator-eu user"
  account_ids = [boundary_account_password.administratorEU.id]
  scope_id    = boundary_scope.aws_org.id
}

resource "boundary_user" "administratorAP" {
  name        = "administrator-ap"
  description = "administrator-ap user"
  account_ids = [boundary_account_password.administratorAP.id]
  scope_id    = boundary_scope.aws_org.id
}


