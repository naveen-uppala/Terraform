provider "aws" {
  region = "ap-south-1"  # Update with your preferred region
}

resource "aws_eks_cluster" "ekscluster" {
  name     = "batch17"
  role_arn = aws_iam_role.EksClusterRole.arn
  vpc_config {
    subnet_ids = ["subnet-06d716c8e955c6113", "subnet-0dac379e2dcccd0ab", "subnet-06cc9a093404f7375"]
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
}

output "endpoint" {
  value = aws_eks_cluster.ekscluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.ekscluster.certificate_authority[0].data
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "EksClusterRole" {
  name               = "eks-cluster-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"]
}
