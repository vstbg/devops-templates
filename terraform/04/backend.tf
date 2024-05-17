terraform {
  backend "s3" {
    bucket = "vtech-s3-bgai"
    key    = "vtech/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_lock"
  }
}
