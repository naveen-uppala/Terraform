provider "aws" {
  region = var.aws_region
}

#Create EC2 instance for testing purpose
resource "aws_instance" "myFirstInstance" {
  ami     = var.ami_id
  instance_type = t2.micro
}  


