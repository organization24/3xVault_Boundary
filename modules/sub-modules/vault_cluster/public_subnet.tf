# Creating a public subnet whichi is containg the NAT gateway
resource "aws_subnet" "public_subnet_internet" {

  vpc_id     = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.vpc_cidr, 4, 4)
  # when set is used for for_each each.key and each.value are the same
  # Example : "192.168.100.0/28" , "192.168.100.16/28" , "192.168.100.32/28"
  map_public_ip_on_launch = true

  tags = {
    Name = "vault-internet-subnet-${var.region}-${var.random_id}"
  }
}