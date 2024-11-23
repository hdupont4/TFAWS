resource "aws_eks_node_group" "eks_node_1" {
  cluster_name   = aws_eks_cluster.eks.name
  node_role_arn  = aws_iam_role.eks_role.arn
  subnet_ids     = [module.core-compute.public_subnet_ids[0]]
  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  ami_type = "AL2_x86_64"

  tags = {
    Name = "eks-node-group-1"
  }
}

resource "aws_eks_node_group" "eks_node_2" {
  cluster_name   = aws_eks_cluster.eks.name
  node_role_arn  = aws_iam_role.eks_role.arn
  subnet_ids     = [module.core-compute.public_subnet_ids[1]]
  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  ami_type = "AL2_x86_64"

  tags = {
    Name = "eks-node-group-2"
  }
}

resource "aws_eks_node_group" "eks_node_3" {
  cluster_name   = aws_eks_cluster.eks.name
  node_role_arn  = aws_iam_role.eks_role.arn
  subnet_ids     = [module.core-compute.public_subnet_ids[2]]
  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  ami_type = "AL2_x86_64"

  tags = {
    Name = "eks-node-group-3"
  }
}
