provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://54.234.220.110:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "1c420075-92c7-d522-80f0-3d09f645989e"
      secret_id = "ea1bd500-2097-41c6-3472-d3b52454b19b"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "name" {
  ami = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"

  tags = {
    secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
