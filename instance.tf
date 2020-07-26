provider "aws" {
  profile = "default"
  version = "~> 2.70"
  region  = "us-east-1"

}

resource "aws_instance" "terraform-ec2" {
  ami           = "ami-08f3d892de259504d"
  instance_type = "t2.micro"
  tags = {
    Name = "terraform"
  }

  network_interface {
    network_interface_id = "${aws_network_interface.terraform.id}"
    device_index         = 0
  }
}