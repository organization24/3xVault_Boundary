# Setup variables for the Vault cluster
variable "clusters" {
  type = map(object({
    region         = string
    vpc_cidr       = string
    vault_version  = string
    vault_ec2_type = string
  }))

  description = "Defines all Vault clusters, map of custom objects"
}

#Setup variables for the Boundary worker
variable "boundary_version" {
  description = "Version of the Boundary binary version to be used"
}

variable "boundary_ec2_type" {
  description = "The size of the EC2 instance"
  type        = string
  default     = "small"

  validation {
    condition     = contains(["small", "large"], var.boundary_ec2_type)
    error_message = "The \"boundary_ec2_type\" varible should be one of the following \"small\" or \"large\""
  }
}

# Setup variables for the HCP Boundary cluster
variable "addr" {
  description = "Boundary address"
}

variable "auth_method_id" {
  description = "Auth method ID for login to Boundary"
}

variable "password_auth_method_login_name" {
  description = "Login name"
}

variable "password_auth_method_password" {
  description = "Login password"
  sensitive   = true
}

variable "administratorUS_password" {
  type        = string
  description = "password for US region administrator"
  default     = "administratorUS_password"
}

variable "administratorEU_password" {
  type        = string
  description = "password for EU region administrator"
  default     = "administratorEU_password"
}

variable "administratorAP_password" {
  type        = string
  description = "password for AP region administrator"
  default     = "administratorAP_password"
}