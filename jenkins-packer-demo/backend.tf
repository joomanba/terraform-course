terraform {
  backend "s3" {
    bucket = "terraform-state-p7lip2z0"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
