# Private Subnet 1
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.hdupont.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "private_subnet_1"
  }
}

# Private Subnet 2
resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.hdupont.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "private_subnet_2"
  }
}

# NAT Gateway
resource "aws_eip" "nat" {
  depends_on = [aws_internet_gateway.igw]
  vpc        = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "hdupont_nat_gateway"
  }
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.hdupont.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private_route_table"
  }
}

# Route Table Associations
resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}
