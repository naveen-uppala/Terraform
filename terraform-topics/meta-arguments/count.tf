provider "aws" {
  region = "us-east-2"
}


#Create EC2 instance for testing purpose
resource "aws_instance" "myFirstInstance" {
  count =2  
  ami     = ami-05c3dc660cb6907f0
  instance_type = "t2.micro"
}  
