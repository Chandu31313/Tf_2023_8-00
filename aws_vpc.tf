resource "aws_vpc" "ecomm-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "master-vpc"
  }
}

# Public subnet

resource "aws_subnet" "ecomm-pb-sn" {
  vpc_id     = aws_vpc.ecomm-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone="us-east-2a"
  map_public_ip_on_launch="true"
  tags = {
    Name = "ecom-public-subnet"
  }
}


# Private subnet

resource "aws_subnet" "ecomm-pvt-sn" {
  vpc_id     = aws_vpc.ecomm-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone="us-east-2b"
  map_public_ip_on_launch="false"
  tags = {
    Name = "ecom-private-subnet"
  }
}

# internet gateway
resource "aws_internet_gateway" "ecomm-igw" {
  vpc_id = aws_vpc.ecomm-vpc.id

  tags = {
    Name = "ecom-internet-gateway"
  }
}

#public route table

resource "aws_route_table" "ecomm-pub-rt" {
  vpc_id = aws_vpc.ecomm-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ecomm-igw.id
  }

  

  tags = {
    Name = "ecomm-public-rout-table"
  }
}