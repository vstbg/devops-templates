 provider "aws" {
     region = "us-east-1"  # Set the AWS region
   }

   resource "aws_instance" "example" {
     ami = "ami-0bb84b8ffd87024d8"  # Specify the AMI ID
     instance_type = "t2.micro"
     key_name = "ec2-key"
   }
