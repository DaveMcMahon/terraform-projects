terraform {
  backend "s3" {
    bucket = "terraform-dmc-bucket"
    key = "terraform/myexamples"
  }
}