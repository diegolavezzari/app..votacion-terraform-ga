terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Rol IAM para el clúster EKS
resource "aws_iam_role" "eks_role" {
  name = "eks_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Effect    = "Allow"
      Sid       = ""
    }]
  })
}

# Rol IAM para los nodos del grupo EKS
resource "aws_iam_role" "node_role" {
  name = "${var.cluster_name}-node-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Adjuntar políticas al rol de los nodos
resource "aws_iam_role_policy_attachment" "eks_node_policies" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  ])
  role       = aws_iam_role.node_role.name
  policy_arn = each.value
}

resource "aws_security_group" "node_group_sg" {
  name        = "${var.cluster_name}-node-group-sg"
  description = "Security Group for EKS Node Group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.cluster_name}-node-group-sg"
  }
}

resource "aws_security_group_rule" "allow_internal_traffic" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  security_group_id = aws_security_group.node_group_sg.id
  source_security_group_id = aws_security_group.node_group_sg.id
}

resource "aws_security_group_rule" "allow_kubelet_traffic" {
  type        = "ingress"
  from_port   = 10250
  to_port     = 10250
  protocol    = "tcp"
  security_group_id = aws_security_group.node_group_sg.id
  source_security_group_id = aws_security_group.node_group_sg.id
}

# Crear el clúster EKS
resource "aws_eks_cluster" "cluster_vote" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids              = var.mi_subnet
    security_group_ids      = [aws_security_group.node_group_sg.id]
    endpoint_private_access = true
    endpoint_public_access  = true
  }
}

# Crear un grupo de nodos EKS
resource "aws_eks_node_group" "mi_node_group" {
  cluster_name    = aws_eks_cluster.cluster_vote.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = aws_iam_role.node_role.arn

  subnet_ids = var.mi_subnet

  scaling_config {
    desired_size = var.desired_capacity
    min_size     = var.min_size
    max_size     = var.max_size
  }
  depends_on = [aws_iam_role_policy_attachment.eks_node_policies]
}
