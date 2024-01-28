provider "aws" {
  region = "us-east-2"
}


import {
  to = aws_security_group.mysg
  id = "sg-043966bd56a596038"
}