provider "aws" {
  region = "us-east-2" # Change this to your desired region
}
# The RDS instance resource requires an ARN. Look up the ARN of the KMS key.
# data "aws_kms_key" "by_id" {
#   key_id = "1bcd81ac-93cf-4996-be8e-05da6664a39e" # KMS key
# }

resource "aws_db_instance" "default" {
  # kms_key_id            = data.aws_kms_key.by_id.arn
  identifier            = "database-1"
  allocated_storage    = 20
  storage_type          = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.33"
  instance_class        = "db.t3.micro"
  db_name               = "batch16"
  username              = "naveen"
  password              = "naveennaveen"
  storage_encrypted = true
  publicly_accessible   = true
#   parameter_group_name = "default:mysql-8-0"
#   custom_iam_instance_profile = "AWSRDSCustomSQLServerInstanceRole" 
  vpc_security_group_ids = ["sg-043966bd56a596038"]
  multi_az              = false
  availability_zone     = "us-east-2b"
}


# resource "aws_db_subnet_group" "subnet-group1" {
#   name       = "subnet-group1"
#   subnet_ids = ["subnet-07a79a05f0fa816c0", "subnet-08d40b136a6a8b2c9","subnet-0614a6a0e1e659fb1"] 
# }