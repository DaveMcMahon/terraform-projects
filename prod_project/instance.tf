resource "aws_instance" "dmc-ec2-example" {
  ami = var.AMIS[var.AWS_REGION]
  instance_type = var.INSTANCE_TYPE

  subnet_id = var.ENV == "DEV" ? aws_subnet.dmc-private-1.id : aws_subnet.dmc-public-1.id
  vpc_security_group_ids = [var.ENV == "DEV" ? aws_security_group.allow-ssh-dev.id : aws_security_group.allow-ssh-prod.id]
  key_name = aws_key_pair.terrakeys.key_name
  user_data = data.template_cloudinit_config.cloudinit-dmc.rendered
}

resource "aws_ebs_volume" "ebs-dmc-volume" {
  availability_zone = "${var.AWS_REGION}a"
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

output "ip" {
  value = aws_instance.dmc-ec2-example.public_ip
}