variable "instance_count" {
  default = "1"
}

# EC2 INSTANCE - PRIVATE SUBNET
resource "aws_instance" "ec2-private" {
  for_each = toset(local.private_subnets)


  ami                    = "ami-0889a44b331db0194"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ssh_private_sg.id]
  subnet_id              = aws_subnet.this[each.value].id

  tags = {
    Project = "Terraform"
    Subnet  = "Private"
  }
}

# EC2 INSTANCE - PUBLIC SUBNET
resource "aws_instance" "ec2-public" {
  for_each              = toset(local.public_subnets)
  
  ami                    = "ami-0889a44b331db0194"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ssh_public_sg.id]
  subnet_id              = aws_subnet.this[each.value].id


  tags = {
    Project = "Terraform"
    Subnet  = "Public"
  }
}