resource "aws_instance" "dmc-ec2-example" {
  ami = var.AMI[var.REGION]
  instance_type = var.INSTANCE_TYPE

  subnet_id = aws_subnet.dmc-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name = 

  resource "aws_ebs_volume" "ebs-dmc-volume" {
    availability_zone = "eu-west-1a"
    size = "20"
    type = "gp2"
    tags = {
      Name = "extra data storage"
    }
  }

  resource "aws_volume_attachment" "ebs-dmc-volume-attachment" {
    device_name = var.DEVICE_NAME
    volume_id = aws_ebs_volume.ebs-dmc-volume.id
    instance_id = aws_instance.dmc-ec2-example.id
    skip_destroy = true
  }