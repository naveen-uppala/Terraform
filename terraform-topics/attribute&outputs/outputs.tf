provider "aws" {
  region = "us-east-2"
}

#Create EC2 instance for testing purpose
resource "aws_instance" "myFirstInstance" {
  ami     = "ami-05c3dc660cb6907f0"
  instance_type = "t2.micro"
}  

output "private-ip" {
  value = aws_instance.myFirstInstance.private_ip
}

output "public-ip" {
  value = aws_instance.myFirstInstance.public_ip
}

output "jenkins-url" {
  value = "http://${aws_instance.myFirstInstance.public_ip}:8080/"
}