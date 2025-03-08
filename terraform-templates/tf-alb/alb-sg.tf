provider "aws" {
   region = var.region
}

#Create security group with firewall rules
resource "aws_security_group" "frontend_alb_sg" {
  name        = "frontend alb sg"
  description = "security group for allowing http and https traffic ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "frontend alb sg"
  }
}

