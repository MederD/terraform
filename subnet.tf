resource "aws_subnet" "terraform" {
  vpc_id     = "${aws_vpc.terraform.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "terraform"
  }
}
resource "aws_network_interface" "terraform" {
  subnet_id   = "${aws_subnet.terraform.id}"
  private_ips = ["10.0.1.100"]

  tags = {
    Name = "primary_network_interface"
  }
}