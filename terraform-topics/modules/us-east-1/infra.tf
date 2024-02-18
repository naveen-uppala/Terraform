provider "aws" {
  region = "us-east-1"
}
module "ec2module" {
  source = "../tf-modules/EC2"
  ami_id = "ami-0e731c8a588258d0d"
  instance_type ="t2.micro"
}

module "sgmodule" {
  source = "../tf-modules/SG"
  vpc_id = "vpc-06db7a0443e4005b5"
}