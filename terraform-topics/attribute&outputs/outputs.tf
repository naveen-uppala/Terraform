#Create EC2 instance for testing purpose
resource "aws_instance" "myFirstInstance" {
  ami     = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
}  

# output "public-ip" {
#   value = aws_instance.myFirstInstance.private_ip
# }

# output "public-ip" {
#   value = "http://${aws_instance.myFirstInstance.public_ip}:8080"
# }
