resource "aws_security_group" "allow-ssh" {
  name = "allow-ssh"
  description = "Allow SSH ingress"
  vpc_id = aws_vpc.dmc-vpc.id

  ingress {
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow-ssh"
  }
}

resource "aws_security_group" "allow-mariadb" {
  vpc_id = aws_vpc.dmc-vpc.id
  name = "allow-mariadb"
  description = "security group to allow 3306 traffic"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.allow-ssh.id]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self = true
  }

  tags = {
    Name = "allow-mariadb"
  }
}