# Roles for each regions administrators, allows access for administartors for their respective region. For example administratorUS only has access to US target.
resource "boundary_role" "administratorUS" {
  name          = "administratorUS"
  description   = "A role for connecting and administrating US region instances"
  principal_ids = [boundary_user.administratorUS.id]
  grant_strings = ["id=${boundary_target.target_US.id};actions=authorize-session", "id=*;type=target;actions=list,read"]
  scope_id      = boundary_scope.project.id
}

resource "boundary_role" "administratorEU" {
  name          = "administratorEU"
  description   = "A role for connecting and administrating EU region instances"
  principal_ids = [boundary_user.administratorEU.id]
  grant_strings = ["id=${boundary_target.target_EU.id};actions=authorize-session", "id=*;type=target;actions=list,read"]
  scope_id      = boundary_scope.project.id
}

resource "boundary_role" "administratorAP" {
  name          = "administratorAP"
  description   = "A role for connecting and administrating AP region instances"
  principal_ids = [boundary_user.administratorAP.id]
  grant_strings = ["id=${boundary_target.target_AP.id};actions=authorize-session", "id=*;type=target;actions=list,read"]
  scope_id      = boundary_scope.project.id
}