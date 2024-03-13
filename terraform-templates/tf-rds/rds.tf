provider "aws" {
  region = var.region
}

resource "aws_db_instance" "aws_rds" {
  identifier            = var.db_instance_identifier
  allocated_storage    = var.allocated_storage
  storage_type          = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class        = var.instance_class
  db_name               = var.db_name
  username              = var.db_username
  password              = var.db_password
  storage_encrypted = true
  publicly_accessible   = true
  vpc_security_group_ids = var.vpc_security_group_ids
  multi_az              = false
  availability_zone     = var.availability_zone

  final_snapshot_identifier = var.skip_final_snapshot ? null : "var.final_snapshot_identifier"
  skip_final_snapshot = var.skip_final_snapshot

  tags = {
    Name        = "TCN-RDS"
    Environment = "Production"
    Owner       = "komal"
    # Add more tags as needed
  }
}
