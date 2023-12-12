provider "aws" {
  region = "us-east-1"
}

#Create security group with firewall rules
resource "aws_security_group" "batch16_security_grp" {
  name        = "Batch-16 Security Group"
  description = "security group for allowing SSH traffic to EC2 instances"
  vpc_id = "vpc-09b77ec6cfd8f4129"

 ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from Ec
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "Batch-16 Security Group"
  }
}
resource "aws_security_group" "batch17_security_grp" {
  name        = "Batch-17 Security Group"
  description = "security group for allowing SSH traffic to EC2 instances"
  vpc_id = "vpc-09b77ec6cfd8f4129"

 ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 # outbound from Ec
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "Batch-17 Security Group"
  }

}


