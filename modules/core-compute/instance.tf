resource "aws_instance" "GRP4" {
  ami             = data.aws_ami.AMI.id
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_1.id
  security_groups = [aws_security_group.sg.id]

  tags = {
    Name = "GRP4-instance"
  }
}

data "aws_ami" "AMI" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-kernel-6.1-x86_64"]
  }
}

