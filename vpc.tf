resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Test VPC"

  }

}


resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Test IG"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.publicsubnet1_cidr
  availability_zone       = var.az-01
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 01"
  }

}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.publicsubnet2_cidr
  availability_zone       = var.az-02
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet 02"
  }

}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "ps1-route-table" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "ps2-route-table" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_subnet" "pvt-sn-01" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.privatesubnet1_cidr
  availability_zone       = var.az-01
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 01 | App Tier"
  }
}
resource "aws_subnet" "pvt-sn-03" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.privatesubnet3_cidr
  availability_zone       = var.az-01
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 03 | DB Tier"
  }
}
resource "aws_subnet" "pvt-sn-02" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.privatesubnet2_cidr
  availability_zone       = var.az-02
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 02 | App Tier"
  }
}
resource "aws_subnet" "pvt-sn-04" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.privatesubnet4_cidr
  availability_zone       = var.az-02
  map_public_ip_on_launch = false

  tags = {
    Name = "Private Subnet 04 | DB Tier"
  }
}

