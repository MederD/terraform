provider "aws" {
  profile = "default"
  version = "~> 2.70"
  region  = "us-east-2"
}

resource "aws_instance" "ohio-pub" {
  #ami           = "ami-07c8bc5c1ce9598c3"
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  key_name      = "ubuntu_keygen"
  subnet_id     = aws_subnet.terraform.id
  associate_public_ip_address = true  
  vpc_security_group_ids = [aws_security_group.terraform.id]
  
  tags = {
    Name = "ohio-pub"
  }  

  
 }