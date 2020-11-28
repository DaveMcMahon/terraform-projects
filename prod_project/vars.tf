variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "ENV" {
  default = "PROD"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "ami-0a273e2936ffb0ab9"
  }
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "INSTANCE_UNAME" {
  default = "ubuntu"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "../keys/terrakeys.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "../keys/terrakeys"
}

variable "DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "RDS_USERNAME" {
}

variable "RDS_PASSWORD"{
}