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

module "vpc" {
  source = "terraform-google-modules/network/google"
  version = "~>6.0.0.0"

  project_id = var.project_id
  network_name = "tf-vpc-982777"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name = "subnet-01"
      subnet_ip = "10.10.10.0/24"
      subnet_region = var.region
    },
    {
      subnet_name = "subnet-02"
      subnet_ip = "10.10.20.0/24"
      subnet_region = var.region
      subnet_private_access = "true"
      subnet_flow_logs = "true"
    }
  ]
}
