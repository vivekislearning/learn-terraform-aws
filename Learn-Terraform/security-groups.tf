resource "aws_security_group" "learn-jumpserver-ssh-allow" {
  vpc_id = "${aws_vpc.learn-vpc-01.id}"
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "learn-jumpserver-ssh-allow"
  }
}

resource "aws_security_group" "learn-webserver-private-allow" {
  vpc_id = "${aws_vpc.learn-vpc-01.id}"
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["10.0.2.0/24"]
  }

  tags = {
    Name = "learn-webserver-allow"
  }
}

resource "aws_security_group" "learn-webserver-public-allow" {
  vpc_id = "${aws_vpc.learn-vpc-01.id}"
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "learn-webserver-allow"
  }
}
