terraform {
  backend "gcs" {
    bucket = "tf-bucket-324184"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "4.56.0"
    }
  }
}

provider "google" {
    project = var.project_id
    region = var.region
    zone = var.zone
}

module "instance" {
  source = "./modules/instances"
}

module "storage" {
  source = "./modules/storage"
}
