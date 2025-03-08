# VPC Variables
variable "region" {
  # type       = string
  description   = "AWS Region"
}

variable "vpc-cidr" {
  type          = string
  description   = "VPC CIDR Block"
}

variable "web-tier-subnet-1-cidr" {
  type          = string
  description   = "Public Subnet 1 CIDR Block"
}

variable "web-tier-subnet-2-cidr" {
  type          = string
  description   = "Public Subnet 2 CIDR Block"
}

variable "web-tier-subnet-3-cidr" {
  type          = string
  description   = "Public Subnet 3 CIDR Block"
}

variable "app-tier-subnet-1-cidr" {
  type          = string
  description   = "Private Subnet 1 CIDR Block"
}

variable "app-tier-subnet-2-cidr" {
  type          = string
  description   = "Private Subnet 2 CIDR Block"
}

variable "app-tier-subnet-3-cidr" {
  type          = string
  description   = "Private Subnet 3 CIDR Block"
}

variable "data-tier-subnet-1-cidr" {
  type          = string
  description   = "Private Subnet 4 CIDR Block"
}

variable "data-tier-subnet-2-cidr" {
  type          = string
  description   = "Private Subnet 5 CIDR Block"
}

variable "data-tier-subnet-3-cidr" {
  type          = string
  description   = "Private Subnet 6 CIDR Block"
}