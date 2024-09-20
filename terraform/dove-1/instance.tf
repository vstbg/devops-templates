provider "aws" {
  region = "us-east-2"
  #   access_key = ""
  #   secret_key = ""
}

resource "aws_instance" "intro" {
  ami                    = "ami-069d73f3235b535bd"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-2a"
  key_name               = "dove-key"
  vpc_security_group_ids = ["sg-0b0a7661ab5ae46ff"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}
