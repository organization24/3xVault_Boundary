resource "aws_instance" "boundary_worker" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = local.boundary_ec2_type
  subnet_id     = aws_subnet.boundary_subnet.id          # Subnet for the Boundary EC2 
  key_name      = aws_key_pair.boundary-ssh-key.key_name # Waiting on the key to be created first

  vpc_security_group_ids      = [aws_security_group.boundary.id]
  associate_public_ip_address = true
  ebs_optimized               = false
  #private_ip                  = cidrhost(data.aws_subnet.subnets[each.key].cidr_block, 5) # Giving EC2 the 5th IP of each subnet, the first 4 and the last 4 IPs of each subnet are reserved by AWS

  tags = {
    Name = "boundary-${var.region}-${var.random_id}"
  }
  # Provisioning Boundary
  user_data = data.cloudinit_config.boundary_host.rendered

  lifecycle {
    precondition {
      condition     = data.aws_ami.ubuntu.architecture == "x86_64"
      error_message = "The selected AMI must be for the x86_64 architecture."
    }
    ignore_changes = ["user_data"]
  }
}
