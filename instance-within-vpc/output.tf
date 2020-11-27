output "instance" {
  value = aws_instance.dmc-ec2-example.public_ip
}

output "rds" {
  value = aws_db_instance.mariadb.endpoint
}