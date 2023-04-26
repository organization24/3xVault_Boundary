# Creating a route table and default GW
resource "aws_route_table" "route" {

  vpc_id = data.aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.gw.id
  }

  # Ignoring all the changes in a route table when the VPC module adds new routes for the peering to work
  lifecycle {
    ignore_changes = all
  }

  tags = {
    Name = "boundary-${var.region}-${var.random_id}"
  }
}

# Associating the route table with the subnet
resource "aws_route_table_association" "route" {

  subnet_id      = aws_subnet.boundary_subnet.id
  route_table_id = aws_route_table.route.id

}

