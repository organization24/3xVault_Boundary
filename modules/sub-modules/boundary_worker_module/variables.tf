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

variable "vpc_cidr" {
  description = "Provides the CIDR for the whole VPC, for example 192.168.100.0/24"
}

variable "region" {
  description = "Describest the region"
}

variable "random_id" {
  description = "Random ID for the current deployment"
}

variable "hcp_boundary_cluster_id" {
  description = "Boundary cluster ID used for rendering the Boundary worker config file"
}

variable "controller_generated_activation_token" {
  description = "Controller generated token used for rendering the Boundary worker config file"
}