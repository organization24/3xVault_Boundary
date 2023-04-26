output "worker_tokens" {
  value = boundary_worker.boundary_worker_aws
}

output "auth_method_id" {
  description = "Outputs the auth method ID for administative_auth method used for targets login"
  value       = boundary_auth_method.administative_auth.id
}

output "org_id_aws" {
  description = "Outputs the organization ID for AWS org"
  value       = boundary_scope.aws_org.id
}