provider "aws" {
  region     = "${var.region}"
}

#Provisioning the machine
resource "aws_instance" "jenkins" {
    count = "1"
    ami = "${var.amis}"
    instance_type = "${var.instance_type}"
    key_name = "${var.key_name}"
    availability_zone = "${var.region}${var.zones}"
    vpc_security_group_ids = ["${aws_security_group.basic_sg.id}"]
   #placement_group = "${aws_placement_group.web.id}"
    subnet_id = "${var.subnet_id}"
	tags {
    Name = "jenkins-box"
    Owner = "pushpraj"
  }
}

 resource "aws_security_group" "basic_sg" {
  vpc_id = "${var.vpc_id}"
  name = "${var.security_group_name}"
  description = "basic security group"
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["10.128.0.0/10"]
  }
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
}
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

