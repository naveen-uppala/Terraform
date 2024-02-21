provider "aws" {
  region = "us-east-1"
}

#Create EC2 instance for testing purpose
resource "aws_instance" "myFirstInstance" {
  ami     = "ami-0440d3b780d96b29d"
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