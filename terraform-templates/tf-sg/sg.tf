provider "aws" {
   region = var.aws_region
}

#Create security group with firewall rules
resource "aws_security_group" "tcn_security_grp" {
  name        = "tcn Security Group"
  description = "security group for allowing SSH traffic to EC2 instances"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_block
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tcn Security Group"
  }
}

