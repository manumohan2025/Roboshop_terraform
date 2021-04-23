data "aws_ami" "ami" {
  owners           = ["self"]
  most_recent      = true
}

data "terraform_remote_state" "vpc" {
  backend          = "s3"

  config = {
    bucket         = "mybucket-terra"
    key            = "vpc/${var.ENV}/terraform.tfstate"
    region         = var.region
    }
  }
}
