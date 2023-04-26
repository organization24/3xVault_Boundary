# Creating a route table default GW for the public subnet - "public_subnet_internet", so the NAT gateway can access the internet
resource "aws_route_table" "route_to_igw" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  # Ignoring all the changes in a route table when the VPC module adds new routes for the peering to work
  lifecycle {
    ignore_changes = all
  }

  tags = {
    Name = "vault-public-${var.region}-${var.random_id}"
  }
}

resource "aws_route_table_association" "route_to_igw" {
  subnet_id      = aws_subnet.public_subnet_internet.id
  route_table_id = aws_route_table.route_to_igw.id

}