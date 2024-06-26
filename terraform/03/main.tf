provider "aws" {
  region = "us-east-1"
}

# Using ready module
module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-053b0d53c279acc90" # replace this
  instance_type_value = "t2.micro"
  key_name = "my-key" # replace this
}
