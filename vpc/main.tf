# VPC
resource "aws_vpc" "myvpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "myvpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "my-igw"
  }
}

# Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

# Subnets
resource "aws_subnet" "sn1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "sn1"
    "kubernetes.io/role/elb" = "1"  # ✅ Required for public ALB
    "kubernetes.io/cluster/my-cluster" = "owned"
  }
}

resource "aws_subnet" "sn2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.12.0/24"
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "sn2"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/my-cluster" = "owned"
  }
}

resource "aws_subnet" "sn3" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.13.0/24"
  availability_zone       = "eu-north-1c"
  map_public_ip_on_launch = true

  tags = {
    Name                     = "sn3"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/my-cluster" = "owned"
  }
}

# Subnet associations with route table
resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.sn1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "a2" {
  subnet_id      = aws_subnet.sn2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "a3" {
  subnet_id      = aws_subnet.sn3.id
  route_table_id = aws_route_table.public.id
}

# Security Group
resource "aws_security_group" "sg" {
  name        = "my_sg"
  description = "EKS Cluster and Node Access"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Kubernetes API"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_sg"
  }
}
