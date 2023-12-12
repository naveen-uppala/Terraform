variable "primary_region" {
       description = "The AWS region to create Infrastructure" 
       default     = "us-east-1" 
}

variable "key_name" { 
    description = " SSH key to connect to ec2 instance" 
    default     =  "komaldockerp1" 
}

variable "instance_type" { 
    description = "instance type for ec2" 
    default     =  "t2.micro" 
}

variable "ami_id" { 
    description = "AMI for Amazon-Linux Ec2 instance" 
    default     = "ami-0230bd60aa48260c6" 
}

variable "subnet_id" { 
    description = "Subnet to launch Amazon-Linux Ec2 instance" 
    default     = "subnet-0e197f08b5b755257" 
}

variable "securitygrp_id" { 
    description = "Security group for attaching to EC2 instance" 
    default     = "sg-09d434ff9fb48519a" 
}