resource "aws_security_group" "boundary" {
  name        = "Boundary-sg-${var.region}-${var.random_id}"
  description = "SG for Boundary traffic"
  vpc_id      = data.aws_vpc.vpc.id

  tags = {
    Name = "boundary-${var.region}-${var.random_id}"
  }

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Vault Client Traffic
  ingress {
    from_port   = 9201
    to_port     = 9201
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Vault cluster (node-to-node) traffic 

  ingress {
    from_port   = 9202
    to_port     = 9202
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  # All TCP connections are allowed if they are located in the same SG
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }

  # All ICMP connections are allowed if they are located in the same SG
  ingress {
    from_port = 0
    to_port   = 254
    protocol  = "icmp"
    self      = true
  }

  # Leaving traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}