resource "aws_launch_configuration" "dmc-launchconfig" {
  name_prefix = "dmc-launchconfig"
  image_id = var.AMIS[var.AWS_REGION]
  instance_type = var.INSTANCE_TYPE
  key_name = aws_key_pair.terrakeys.key_name
  security_groups = [aws_security_group.allow-ssh.id]
}

resource "aws_autoscaling_group" "dmc-autoscaling" {
  name = "dmc-autoscaling"
  vpc_zone_identifier = [aws_subnet.dmc-public-1.id, aws_subnet.dmc-public-2.id]
  launch_configuration = aws_launch_configuration.dmc-launchconfig.name
  min_size = 1
  max_size = 2
  health_check_grace_period = 200
  health_check_type = "EC2"
  force_delete = true

  tag {
    key = "Name"
    value = "ec2 instance"
    propagate_at_launch = true
  }
}