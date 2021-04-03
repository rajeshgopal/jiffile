# VPC

resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable_dns
  enable_dns_support   = var.enable_dns

  tags = {
    Name = var.name
  }
}

# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.name
  }
}

# EIP

resource "aws_eip" "nat" {
  count = length(var.azs)
  vpc   = true
}

# NAT Gateways

resource "aws_nat_gateway" "nat" {
  count         = length(var.azs)
  allocation_id = element(aws_eip.nat.*.id, count.index)
  subnet_id     = element(aws_subnet.dmz.*.id, count.index)
}

# Private Subnets
resource "aws_subnet" "web" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.private_subnets, var.subnet_size, count.index)
  availability_zone = var.azs[count.index]

  tags = {
    Name   = "${var.name}-web-${var.azs[count.index]}"
    public = "false"
  }
}

resource "aws_subnet" "app" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.private_subnets, var.subnet_size, count.index + 5)
  availability_zone = var.azs[count.index]

  tags = {
    Name   = "${var.name}-app-${var.azs[count.index]}"
    public = "false"
  }
}

resource "aws_subnet" "data" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.private_subnets, var.subnet_size, count.index + 10)
  availability_zone = var.azs[count.index]

  tags = {
    Name   = "${var.name}-data-${var.azs[count.index]}"
    public = "false"
  }
}

# Public Subnets

resource "aws_subnet" "dmz" {
  count                   = length(var.azs)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(var.public_subnets, var.subnet_size, count.index)
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name   = "${var.name}-dmz-${var.azs[count.index]}"
    public = "true"
  }
}
