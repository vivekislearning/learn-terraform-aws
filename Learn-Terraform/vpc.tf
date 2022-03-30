resource "aws_vpc" "learn-vpc-01" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags = {
      Name = "learn-vpc-01"
    }
}

resource "aws_subnet" "learn-subnet-public-1" {
    vpc_id = "${aws_vpc.learn-vpc-01.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-east-1a"
    tags = {
        Name = "learn-subnet-public-1"
    }
}

resource "aws_subnet" "learn-subnet-public-2" {
    vpc_id = "${aws_vpc.learn-vpc-01.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-east-1b"
    tags = {
        Name = "learn-subnet-public-2"
    }
}

resource "aws_subnet" "learn-subnet-public-3" {
    vpc_id = "${aws_vpc.learn-vpc-01.id}"
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-east-1c"
    tags = {
        Name = "learn-subnet-public-3"
    }
}

resource "aws_subnet" "learn-subnet-private-1" {
    vpc_id = "${aws_vpc.learn-vpc-01.id}"
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "learn-subnet-private-1"
    }
}

resource "aws_subnet" "learn-subnet-private-2" {
    vpc_id = "${aws_vpc.learn-vpc-01.id}"
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "learn-subnet-private-2"
    }
}

resource "aws_subnet" "learn-subnet-private-3" {
    vpc_id = "${aws_vpc.learn-vpc-01.id}"
    cidr_block = "10.0.6.0/24"
    availability_zone = "us-east-1c"
    tags = {
        Name = "learn-subnet-private-3"
    }
}
