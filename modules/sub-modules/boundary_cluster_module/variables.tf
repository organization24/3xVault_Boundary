variable "region1_addresses" {
  description = "Contains IP addresses for hosts located in region1, usually US"
  type        = map(any)
}

variable "region2_addresses" {
  description = "Contains IP addresses for hosts located in region1, usually EU"
  type        = map(any)
}

variable "region3_addresses" {
  description = "Contains IP addresses for hosts located in region1, usually AP"
  type        = map(any)
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


variable "random_id" {
  type        = string
  description = "Variable used as unique identifier of the current environment"
}

variable "instance_login_name" {
  description = "Username to be used for SSH connections"
  default     = "ubuntu"
}

variable "private_key_us" {
  description = "Contains the private SSH key for US region instances"
}

variable "private_key_eu" {
  description = "Contains the private SSH key for EU region instances"
}

variable "private_key_ap" {
  description = "Contains the private SSH key for AP region instances"
}

variable "clusters" {
  type = map(object({
    region         = string
    vpc_cidr       = string
    vault_version  = string
    vault_ec2_type = string
  }))
  description = "The clusters variable is used for egress filtering of the workers when Targets are being created"
}