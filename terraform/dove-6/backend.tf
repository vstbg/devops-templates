terraform {
  backend "s3" {
    bucket = "terra-state-dove4"
    key    = "terraform/backend_exercise6"
    region = "us-east-2"
  }
}
