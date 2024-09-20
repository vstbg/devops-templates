variable "REGION" {
  default = "us-east-2"
}

variable "ZONE1" {
  default = "us-east-2a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-2 = "ami-069d73f3235b535bd"
    us-east-1 = "ami-06ca3ca175f37dd66"
  }
}
