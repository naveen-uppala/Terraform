resource "aws_eks_node_group" "node-group-1" {
  cluster_name    = aws_eks_cluster.ekscluster.name
  node_group_name = "node-group-1"
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = ["subnet-06d716c8e955c6113", "subnet-0dac379e2dcccd0ab", "subnet-06cc9a093404f7375"]
  capacity_type   = "ON_DEMAND"
  instance_types  = ["t2.medium"]

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
}

resource "aws_iam_role" "node_group_role" {
  name = "eks-node-group"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  
  managed_policy_arns =  ["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy", 
  "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy", 
  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"]
}
