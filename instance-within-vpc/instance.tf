resource "aws_instance" "dmc-ec2-example" {
  ami = var.AMI[var.REGION]
  instance_type = var.INSTANCE_TYPE

  subnet_id = aws_subnet.dmc-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name = aws_key_pair.terrakeys.key_name
}