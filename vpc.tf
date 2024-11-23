resource "aws_vpc" "hdupont" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "hdupont_vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.hdupont.id

  tags = {
    Name = "hdupont_igw"
  }
}
