resource "aws_vpc" "ecoms1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ecom-vpc"
  }
}