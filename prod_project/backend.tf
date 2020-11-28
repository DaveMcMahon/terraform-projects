terraform {
  backend "s3" {
    bucket = "terraform-bucket-dmc-2"
    key = "terraform/myexamples"
  }
}