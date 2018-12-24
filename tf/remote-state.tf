terraform {
  backend "s3" {
    bucket = "devopsapp"
    key    = "golangserver/terraform.tfstate"
    region = "eu-west-1"
  }
}
