resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}
resource "aws_network_interface" "foo" {
  subnet_id   = "${aws_subnet.main.id}"
  private_ips = ["10.0.1.100"]

  tags = {
    Name = "primary_network_interface"
  }
}