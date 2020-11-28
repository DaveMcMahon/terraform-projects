resource "aws_key_pair" "terrakeys" {
  key_name = "terrakeys"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}