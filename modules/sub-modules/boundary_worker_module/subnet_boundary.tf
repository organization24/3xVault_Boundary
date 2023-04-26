# Creating subnet for Boundary worker, public one
resource "aws_subnet" "boundary_subnet" {

  vpc_id     = data.aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, 4, 3) # Getting the forth (starting from zero eg.cidrsubnet("192.168.100.0/24", 4, 3)
  # "192.168.100.48/28" subnet and deploying the Boundary worker in it
  #availability_zone       = element(tolist(local.availability_zones_sliced), 0) # Deploying the Boundary worker in the first subnet
  map_public_ip_on_launch = true

  tags = {
    Name = "boundary-${var.region}-${var.random_id}"
  }
}