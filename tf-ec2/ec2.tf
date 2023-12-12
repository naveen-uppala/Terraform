provider "aws" {
  region = var.primary_region
}

#Create EC2 instance for testing purpose
resource "aws_instance" "myFirstInstance" {
  subnet_id = var.subnet_id
  ami     = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  vpc_security_group_ids= [var.securitygrp_id]
  tags= {
    Name = "Batch-13 Instance"
  }
}  
