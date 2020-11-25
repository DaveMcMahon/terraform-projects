resource "aws_vpc" "dmc-vpc" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  tags = {
    Name = "dmc-vpc"
  }
}

resource "aws_subnet" "dmc-public-1" {
  vpc_id = aws_vpc.dmc-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "dmc-public-1"
  }
}

resource "aws_subnet" "dmc-public-2" {
  vpc_id = aws_vpc.dmc-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "dmc-public-2"
  }
}

resource "aws_subnet" "dmc-private-1" {
  vpc_id = aws_vpc.dmc-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "dmc-private-1"
  }
}

resource "aws_subnet" "dmc-private-2" {
  vpc_id = aws_vpc.dmc-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "dmc-private-2"
  }
}

resource "aws_internet_gateway" "dmc-gw" {
  vpc_id = aws_vpc.dmc-vpc.id
  tags = {
    Name = "dmc-gw"
  }
}

resource "aws_route_table" "dmc-public" {
  vpc_id = aws_vpc.dmc-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.id
  }

  tags = {
    Name = "dmc-public"
  }
}

resource "aws_route_table_association" "main-public-1-a" {
  subnet_id = aws_subnet.dmc-public-1.id
  route_table_id = aws_route_table.dmc-public.id
}

resource "aws_route_table_association" "main-public-1-b" {
  subnet_id = aws_subnet.dmc-public-2.id
  route_table_id = aws_route_table.dmc-public.id
}

