resource "aws_internet_gateway" "learn-igw-01" {
    vpc_id = "${aws_vpc.learn-vpc-01.id}"
    tags = {
        Name = "learn-igw-01"
    }
}

resource "aws_route_table" "learn-public-crt-01" {
    vpc_id = "${aws_vpc.learn-vpc-01.id}"

    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0"
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.learn-igw-01.id}"
    }

    tags = {
        Name = "learn-public-crt-01"
    }
}

resource "aws_route_table_association" "learn-crta-subnet-public-1" {
  subnet_id = "${aws_subnet.learn-subnet-public-1.id}"
  route_table_id = "${aws_route_table.learn-public-crt-01.id}"
}

resource "aws_eip" "learn-nat-eip" {
  vpc      = true
}

resource "aws_nat_gateway" "learn-ngw-01" {
  allocation_id = aws_eip.learn-nat-eip.id
  subnet_id = aws_subnet.learn-subnet-public-1.id
}

resource "aws_route_table" "learn-private-crt-01" {
  vpc_id = aws_vpc.learn-vpc-01.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.learn-ngw-01.id
  }

  tags = {
    Name = "learn-private-crt-01"
    Environment = "Learning"
  }
}

resource "aws_route_table_association" "learn-crta-subnet-private-1" {
  subnet_id = aws_subnet.learn-subnet-private-1.id
  route_table_id = aws_route_table.learn-private-crt-01.id
}

resource "aws_route_table" "learn-private-crt-02" {
  vpc_id = aws_vpc.learn-vpc-01.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.learn-ngw-01.id
  }

  tags = {
    Name = "learn-private-crt-02"
    Environment = "Learning"
  }
}

resource "aws_route_table_association" "learn-crta-subnet-private-2" {
  subnet_id = aws_subnet.learn-subnet-private-2.id
  route_table_id = aws_route_table.learn-private-crt-02.id
}

resource "aws_route_table" "learn-private-crt-03" {
  vpc_id = aws_vpc.learn-vpc-01.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.learn-ngw-01.id
  }

  tags = {
    Name = "learn-private-crt-03"
    Environment = "Learning"
  }
}

resource "aws_route_table_association" "learn-crta-subnet-private-3" {
  subnet_id = aws_subnet.learn-subnet-private-3.id
  route_table_id = aws_route_table.learn-private-crt-03.id
}
