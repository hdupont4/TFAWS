resource "aws_eks_cluster" "eks" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [
      module.core-compute.public_subnet_ids[0],
      module.core-compute.public_subnet_ids[1],
      module.core-compute.public_subnet_ids[2]
    ]
  }

  version = var.eks_version

  tags = {
    Name = "eks-cluster"
  }

  depends_on = [module.core-compute]
}
