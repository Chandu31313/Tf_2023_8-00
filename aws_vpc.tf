resource "aws_vpc" "ecomm-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "master-vpc"
  }
}

# Public subnet

resource "aws_subnet" "ecom-pb-sn" {
  vpc_id     = aws_vpc.ecomm-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone="us-east-2a"
  map_public_ip_on_launch="true"
  tags = {
    Name = "ecom-public-subnet"
  }
}
