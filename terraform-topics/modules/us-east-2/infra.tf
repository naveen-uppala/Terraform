provider "aws" {
  region = "us-east-2"
}

module "sgmodule" {
  source = "../tf-modules/SG"
  vpc_id = "vpc-00383e29bb7567ac7"
  sg_name = "batch19-sg"
  sg_tag_name = "batch19-sg"
}

module "ec2module" {
  source = "../tf-modules/EC2"
  ami_id = "ami-05c3dc660cb6907f0"
  instance_type ="t2.large"
  security_groups = [module.sgmodule.security_group_id]
}
