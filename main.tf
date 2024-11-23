provider "aws" {
  region = "eu-west-3"
}

module "core-compute" {
  source               = "./modules/core-compute"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  region               = "eu-west-3"
}
