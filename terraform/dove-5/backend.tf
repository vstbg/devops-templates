terraform {
  backend "s3" {
    bucket = "terra-state-dove4"
    key    = "terraform/backend"
    region = "us-east-2"
  }
}
