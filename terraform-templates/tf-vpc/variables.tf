# VPC Variables
variable "region" {
  # type       = string
  description   = "AWS Region"
}

variable "vpc-cidr" {
  type          = string
  description   = "VPC CIDR Block"
}

variable "public-subnet-1-cidr" {
  type          = string
  description   = "Public Subnet 1 CIDR Block"
}

variable "public-subnet-2-cidr" {
  type          = string
  description   = "Public Subnet 2 CIDR Block"
}

variable "private-subnet-1-cidr" {
  type          = string
  description   = "Private Subnet 1 CIDR Block"
}

variable "private-subnet-2-cidr" {
  type          = string
  description   = "Private Subnet 2 CIDR Block"
}

variable "private-subnet-3-cidr" {
  type          = string
  description   = "Private Subnet 3 CIDR Block"
}

variable "private-subnet-4-cidr" {
  type          = string
  description   = "Private Subnet 4 CIDR Block"
}
