resource "aws_eip" "elastic-ips-nat-01" {
  domain = "vpc"

  tags = {
    Name = "Elastic IP for NAT 01"
  }
}


resource "aws_eip" "elastic-ips-nat-02" {
  domain = "vpc"

  tags = {
    Name = "Elastic IP for NAT 02"
  }
}

resource "aws_nat_gateway" "nat-gateway-01" {
  allocation_id = aws_eip.elastic-ips-nat-01.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "Nat Gateway 01"
  }

}

resource "aws_nat_gateway" "nat-gateway-02" {
  allocation_id = aws_eip.elastic-ips-nat-02.id
  subnet_id     = aws_subnet.public_subnet_2.id


  tags = {
    Name = "Nat Gateway 02"
  }

}

resource "aws_route_table" "private-subnet-route-table-01" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway-01.id
  }

  tags = {
    Name = "Route Table 01"
  }
}

resource "aws_route_table_association" "private-subnet-01-route-table-association" {
  subnet_id      = aws_subnet.pvt-sn-01.id
  route_table_id = aws_route_table.private-subnet-route-table-01.id
}

resource "aws_route_table_association" "private-subnet-03-route-table-association" {
  subnet_id      = aws_subnet.pvt-sn-03.id
  route_table_id = aws_route_table.private-subnet-route-table-01.id
}

resource "aws_route_table" "private-subnet-route-table-02" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway-02.id
  }

  tags = {
    Name = "Route Table 02"
  }
}

resource "aws_route_table_association" "private-subnet-02-route-table-association" {
  subnet_id      = aws_subnet.pvt-sn-02.id
  route_table_id = aws_route_table.private-subnet-route-table-02.id
}

resource "aws_route_table_association" "private-subnet-04-route-table-association" {
  subnet_id      = aws_subnet.pvt-sn-04.id
  route_table_id = aws_route_table.private-subnet-route-table-02.id
}

