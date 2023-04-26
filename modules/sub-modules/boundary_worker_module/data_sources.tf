# Find all availability zones in the region
data "aws_availability_zones" "available" {
  state = "available"
}

# Getting the latest Ubuntu image
data "aws_ami" "ubuntu" {
  most_recent = "true"
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "vpc" {
  tags = {
    Name = "vault-${var.region}-${var.random_id}"
  }
}

data "aws_internet_gateway" "gw" {
  filter {
    name   = "tag:Name"
    values = ["vault-${var.region}-${var.random_id}"]
  }
}
