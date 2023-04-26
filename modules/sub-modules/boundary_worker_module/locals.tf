locals {
  boundary_ec2_type = var.boundary_ec2_type == "large" ? "t3.large" : "t3.small"
}
