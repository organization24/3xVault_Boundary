resource "boundary_worker" "boundary_worker_aws" {
  for_each = toset(["us", "eu", "ap"])

  description = "Boundary worker installed in public subnet in AWS ${each.key} region"
  name        = "worker_${each.key}"
  scope_id    = "global"
}