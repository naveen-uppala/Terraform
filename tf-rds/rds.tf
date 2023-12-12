provider "aws" {
  region = "us-east-1" # Change this to your desired region
}
# The RDS instance resource requires an ARN. Look up the ARN of the KMS key.
data "aws_kms_key" "by_id" {
  key_id = "1bcd81ac-93cf-4996-be8e-05da6664a39e" # KMS key
}

resource "aws_db_instance" "default" {
  kms_key_id            = data.aws_kms_key.by_id.arn
  identifier            = "psk1"
  allocated_storage    = 20
  storage_type          = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.33"
  instance_class        = "db.t3.micro"
  db_name               = "psk1db"
  username              = "psk1"
  password              = "pskpskpsk"
  storage_encrypted = true

#   parameter_group_name = "default:mysql-8-0"
#   custom_iam_instance_profile = "AWSRDSCustomSQLServerInstanceRole"
  
  vpc_security_group_ids = ["sg-02f0ea7e6c53031b3"]




  multi_az              = false
  availability_zone     = "us-east-1a"
}


resource "aws_db_subnet_group" "subnet-group1" {
  name       = "subnet-group1"
  subnet_ids = ["subnet-0e197f08b5b755257", "subnet-046277c041194b849","subnet-0684def2973a370da", "subnet-0c91eb495e92fc850","subnet-04b7d58a379c261f2"] 
}