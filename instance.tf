provider "aws" {
  profile = "default"
  version = "~> 2.70"
  region  = "us-east-1"

}

resource "aws_instance" "terraform-ec2" {
  ami           = "ami-08f3d892de259504d"
  instance_type = "t2.micro"
  key_name = "ubuntu_keygen"
  subnet_id = aws_subnet.terraform.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.terraform.id]


  tags = {
    Name = "terraform"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host = self.public_ip
 }

  provisioner "remote-exec" {
     inline = [
       

        "sudo yum update -y",
        "sudo yum install -y httpd.x86_64",
        "sudo systemctl start httpd.service",
        "sudo systemctl enable httpd.service",
      

   ]
 }


}