provider "aws" {
  region = "ap-south-1"
}

#Create security group with firewall rules
resource "aws_security_group" "batch17_security_grp" {
  name        = "Batch-17 Security Group"
  description = "security group for allowing SSH and HTTP traffic to EC2 instances"
  vpc_id = "vpc-0f751f1df4ef1c711"

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

    ingress {
    from_port   = 80
    to_port     = 80
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


