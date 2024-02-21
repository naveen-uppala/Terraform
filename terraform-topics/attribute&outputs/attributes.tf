# provider "aws" {
#   region = "us-east-1"
# }

# #Create security group with firewall rules
# resource "aws_security_group" "batch17_security_grp" {
#   name        = "Batch-17 Security Group"
#   description = "security group for allowing SSH and HTTP traffic to EC2 instances"
#   vpc_id = "vpc-06db7a0443e4005b5"

#  ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#  # outbound from Ec
#  egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = -1
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags= {
#     Name = "Batch-17 Security Group"
#   }
# }

# #Create EC2 instance for testing purpose
# resource "aws_instance" "myFirstInstance" {
#   ami     = "ami-0e731c8a588258d0d"
#   instance_type = "t2.micro"
#   # #Cross attribute reference 
#   vpc_security_group_ids= [aws_security_group.batch17_security_grp.id]
# }  
