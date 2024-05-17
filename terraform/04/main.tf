provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "vtech" {
  instance_type = "t2.micro"
  ami = "ami-04b70fa74e45c3917"
  key_name = "ec2-key"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "vtech-s3-bgai"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LocID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
