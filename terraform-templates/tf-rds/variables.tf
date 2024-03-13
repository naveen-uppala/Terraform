variable "region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-2" # Change this to your desired region
}

variable "db_instance_identifier" {
  description = "The identifier for the RDS database instance."
  type        = string
  default     = "database-tcn"
}

variable "allocated_storage" {
  description = "The allocated storage for the RDS database instance (in GB)."
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "The storage type for the RDS database instance."
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "The database engine for the RDS database instance."
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The version of the database engine for the RDS database instance."
  type        = string
  default     = "8.0.33"
}

variable "instance_class" {
  description = "The instance class for the RDS database instance."
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database to be created."
  type        = string
  default     = "tcn"
}

variable "db_username" {
  description = "The username for accessing the database."
  type        = string
  default     = "tcn"
}

variable "db_password" {
  description = "The password for accessing the database."
  type        = string
  default     = "tcntcntcn"
}

variable "vpc_security_group_ids" {
  description = "The list of security group IDs associated with the RDS instance."
  type        = list(string)
  default     = ["sg-06ac155edea432fbc"]
}

variable "availability_zone" {
  description = "The availability zone for the RDS instance."
  type        = string
  default     = "us-east-2b"
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the RDS instance."
  type        = bool
  default     = true
}

variable "final_snapshot_identifier" {
  description = "The identifier for the final snapshot when deleting the RDS instance."
  type        = string
  default     = "tcn-snapshot-rds"
}
