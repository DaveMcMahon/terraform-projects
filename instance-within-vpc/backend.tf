terraform {
  backend "s3" {
    bucket = "terraform-bucket-dmc"
    key = "terraform/myexamples"
  }
}