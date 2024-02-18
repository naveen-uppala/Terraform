#Create EC2 instance for testing purpose
resource "aws_instance" "myFirstInstance" {
  ami     = var.ami_id
  instance_type = var.instance_type
}  


