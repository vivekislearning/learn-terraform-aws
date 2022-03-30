/*
resource "aws_instance" "learn-jumpserver-ec2" {
    ami = "ami-033b95fb8079dc481"
    instance_type = "t2.micro"
    # VPC
    subnet_id = "${aws_subnet.learn-subnet-public-1.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.learn-jumpserver-ssh-allow.id}"]
    # the Public SSH key
    key_name = "${aws_key_pair.learn_virginia_keypair_01.id}"	
    provisioner "file" {
      source      = "keys/learn_terraform_aws"
      destination = "/home/${var.EC2_USER}/.ssh/id_rsa"

      connection {
        type        = "ssh"
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
        host        = self.public_ip
      }
    }

    tags = {
      Name = "learn-jumpserver-ec2"
    }
}
*/

resource "aws_instance" "learn-webserver-01" {
    ami = "ami-033b95fb8079dc481"
    instance_type = "t2.micro"
    # VPC
    subnet_id = "${aws_subnet.learn-subnet-public-1.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.learn-webserver-public-allow.id}"]
    # the Public SSH key
    key_name = "${aws_key_pair.learn_virginia_keypair_01.id}"
    # nginx installation
    provisioner "remote-exec" {
      inline = [
        "sudo yum update -y",
        "sudo yum install -y httpd.x86_64",
        "sudo systemctl start httpd.service",
        "sudo systemctl enable httpd.service"
      ]

        connection {
            type = "ssh"
            user = "${var.EC2_USER}"
            private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
            host        = self.public_ip
            timeout     = "5m"
        }
    }

    tags = {
      Name = "learn-webserver-01"
    }
}


resource "aws_instance" "learn-webserver-02" {
    ami = "ami-033b95fb8079dc481"
    instance_type = "t2.micro"
    # VPC
    subnet_id = "${aws_subnet.learn-subnet-public-2.id}"
    # Security Group
    vpc_security_group_ids = ["${aws_security_group.learn-webserver-public-allow.id}"]
    # the Public SSH key
    key_name = "${aws_key_pair.learn_virginia_keypair_01.id}"
    # nginx installation
    provisioner "remote-exec" {
      inline = [
        "sudo yum update -y",
        "sudo yum install -y httpd.x86_64",
        "sudo systemctl start httpd.service",
        "sudo systemctl enable httpd.service"
      ]

        connection {
            type = "ssh"
            user = "${var.EC2_USER}"
            private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
            host        = self.public_ip
            timeout     = "5m"
        }
    }

    tags = {
      Name = "learn-webserver-02"
    }
}


// Sends your public key to the instance
resource "aws_key_pair" "learn_virginia_keypair_01" {
    key_name = "learn_virginia_keypair_01"
    public_key = "${file("${var.PUBLIC_KEY_PATH}")}"
}

