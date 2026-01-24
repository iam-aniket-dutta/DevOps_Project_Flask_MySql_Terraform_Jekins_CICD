# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name      = var.vpc_name
    CreatedBy = var.created_by
  }
}

# Public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.public_subnet_cidr)
  cidr_block        = var.public_subnet_cidr[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name      = "public_subnet-${count.index}"
    CreatedBy = var.created_by
  }
}


# Private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.private_subnet_cidr)
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name      = "private_subnet-${count.index}"
    CreatedBy = var.created_by
  }
}


# Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name      = "igw"
    CreatedBy = var.created_by
  }
}


# Public route table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = ["0.0.0.0/0"]
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name      = "public_rt"
    CreatedBy = var.created_by
  }
}


# Private route table
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name      = "private_rt"
    CreatedBy = var.created_by
  }
}


# Public route table association
resource "aws_route_table_association" "public_rta" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# Private route table association
resource "aws_route_table_association" "private_rta" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
