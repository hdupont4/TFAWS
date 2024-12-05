data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = ["public-subnet-*"]
  }
}
