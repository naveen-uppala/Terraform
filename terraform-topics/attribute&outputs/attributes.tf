# provider "aws" {
#   region = "us-east-2"
# }

# #Create security group with firewall rules
# resource "aws_security_group" "batch19_security_grp" {
#   name        = "Batch-19 Security Group"
#   description = "security group for allowing SSH and HTTP traffic to EC2 instances"
#   vpc_id = "vpc-00383e29bb7567ac7"

#  ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#  ingress {
#     from_port   = 80
#     to_port     = 80
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
#     Name = "Batch-19 Security Group"
#   }
# }

# #Create EC2 instance for testing purpose
# resource "aws_instance" "myFirstInstance" {
#   ami     = "ami-05c3dc660cb6907f0"
#   instance_type = "t2.micro"
#   # #Cross attribute reference 
#   vpc_security_group_ids= [aws_security_group.batch19_security_grp.id]
# }  
