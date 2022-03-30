resource "aws_instance" "my_terraform_first_ec2" {
  ami = "ami-04a50faf2a2ec1901"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_ec2_Allow.id]
  
  tags = {
    Name = "My Terraform First EC2"
  }
}

resource "aws_eip" "lb" {
	vpc = true
	
  tags = {
    Name = "My EIP"
  }

} 

resource "aws_eip_association" "my_terraform_first_ec2_eip" {
	instance_id = "${aws_instance.my_terraform_first_ec2.id}"
	allocation_id = "${aws_eip.lb.id}"
}

resource "aws_security_group" "my_ec2_Allow" {
	name = "my_terraform_first_ec2_sg"
	
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = [var.vpn_ip]
	}
	
		ingress {	
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = [var.vpn_ip]
	}
	
		ingress {	
		from_port = 21
		to_port = 21
		protocol = "tcp"
		cidr_blocks = [var.vpn_ip]
	}
	
		ingress {	
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = [var.vpn_ip]
	}
	
  tags = {
    Name = "My_ec2_allow"
  }	
}