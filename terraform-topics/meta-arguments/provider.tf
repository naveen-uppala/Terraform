provider "aws" {
  alias = "primary"  
  region = "us-east-2"
}

provider "aws" {
  alias = "secondary"  
  region = "us-east-1"
}


#Create EC2 instance for testing purpose
resource "aws_instance" "myFirstInstance" {
  provider= aws.secondary
  depends_on = [aws_security_group.batch19_security_grp]
  ami     = ami-05c3dc660cb6907f0
  instance_type = "t2.micro"
}  
