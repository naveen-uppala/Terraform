  provider "aws" {
  region = "us-east-2"
}
module "ec2module" {
  source = "../tf-modules/EC2"
  ami_id = "ami-0cf7b2f456cd5efd4"
  instance_type ="t2.large"
}

module "sgmodule" {
  source = "../tf-modules/SG"
  vpc_id = "vpc-0b46d8b7746118a42"
}