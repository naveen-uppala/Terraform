provider "aws" {  
  region = "us-east-2"
}

variable "instance_type_counts" {
  type = map(number)
  
  default = {
    "t2.micro"  = 2
    "t2.medium" = 3
  }
}

#Create EC2 instance for testing purpose
resource "aws_instance" "myFirstInstance" {
  for_each = var.instance_type_counts  
  ami     = ami-05c3dc660cb6907f0
  instance_type = each.key
  count = each.value
}  
