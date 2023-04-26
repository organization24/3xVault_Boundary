# EIP used by the NAT gateway
resource "aws_eip" "nat_gateway" {
  vpc = true
}

# NAT gateway
resource "aws_nat_gateway" "gw" {
  subnet_id     = aws_subnet.public_subnet_internet.id
  allocation_id = aws_eip.nat_gateway.allocation_id
  tags = {
    Name = "vault-${var.region}-${var.random_id}"
  }
}

# Internet GW to be used by the NAT gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "vault-${var.region}-${var.random_id}"
  }
}