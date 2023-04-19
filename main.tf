provider "aws" {
  region = "ap-south-1"
}

data "aws_security_group" "example" {
  id = "sg-061d334e74d54ff97"
}

resource "aws_instance" "Automation" {
  ami = "ami-0376ec8eacdf70aae"
  instance_type = "t2.micro"
  subnet_id = "subnet-0c75140c32f8d4e76"
  key_name = "nexuskey"
  vpc_security_group_ids = [data.aws_security_group.example.id]
  associate_public_ip_address = true

  tags = {
    Name = "Automation_Server1"
    OS   = "Amazon_Linux"
  }
}

output "public_ip" {
  value = aws_instance.Automation.public_ip
}