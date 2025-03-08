provider "aws" {
  region = var.region
}
# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block              = var.vpc-cidr
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "CloudNation VPC"
  }
}

# Create Internet Gateway and Attach it to VPC
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "CN IGW"
  }
}

# Create Public Subnet 1
resource "aws_subnet" "web-tier-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.web-tier-subnet-1-cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "web-tier-subnet-1"
  }
}

# Create Public Subnet 2
resource "aws_subnet" "web-tier-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.web-tier-subnet-2-cidr
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "web-tier-subnet-2"
  }
}

# Create Public Subnet 3
resource "aws_subnet" "web-tier-subnet-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.web-tier-subnet-3-cidr
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "web-tier-subnet-3"
  }
}

# Create Route Table and Add Public Route
resource "aws_route_table" "public-route-table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags       = {
    Name     = "Public Route Table"
  }
}

# Associate Public Subnet 1 to "Public Route Table"
resource "aws_route_table_association" "web-tier-subnet-1-route-table-association" {
  subnet_id           = aws_subnet.web-tier-subnet-1.id
  route_table_id      = aws_route_table.public-route-table.id
}

# Associate Public Subnet 2 to "Public Route Table"
resource "aws_route_table_association" "web-tier-subnet-2-route-table-association" {
  subnet_id           = aws_subnet.web-tier-subnet-2.id
  route_table_id      = aws_route_table.public-route-table.id
}

# Associate Public Subnet 3 to "Public Route Table"
resource "aws_route_table_association" "web-tier-subnet-3-route-table-association" {
  subnet_id           = aws_subnet.web-tier-subnet-3.id
  route_table_id      = aws_route_table.public-route-table.id
}

# Create Private Subnet 1
resource "aws_subnet" "app-tier-subnet-1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.app-tier-subnet-1-cidr
  availability_zone        = "${var.region}a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "app-tier-subnet-1"
  }
}


# Create Private Subnet 2
resource "aws_subnet" "app-tier-subnet-2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.app-tier-subnet-2-cidr
  availability_zone        = "${var.region}b"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "app-tier-subnet-2"
  }
}

# Create Private Subnet 3
resource "aws_subnet" "app-tier-subnet-3" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.app-tier-subnet-3-cidr
  availability_zone        = "${var.region}c"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "app-tier-subnet-3"
  }
}

# Create Private Subnet 4
resource "aws_subnet" "data-tier-subnet-1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.data-tier-subnet-1-cidr
  availability_zone        = "${var.region}a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "data-tier-subnet-1"
  }
}

# Create Private Subnet 5
resource "aws_subnet" "data-tier-subnet-2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.data-tier-subnet-2-cidr
  availability_zone        = "${var.region}b"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "data-tier-subnet-2"
  }
}

# Create Private Subnet 6
resource "aws_subnet" "data-tier-subnet-3" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = var.data-tier-subnet-3-cidr
  availability_zone        = "${var.region}c"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "data-tier-subnet-3"
  }
}