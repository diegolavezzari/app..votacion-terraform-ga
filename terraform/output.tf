output "cluster_name" {
  description = "Vote-Cat-Dog"
  value       = aws_eks_cluster.cluster_vote.name
}

output "node_group_name" {
  description = "Vote-Cat-Dog-node"
  value       = aws_eks_node_group.mi_node_group.node_group_name
}

output "node_group_subnet_ids" {
  description = "subnet-eks-vote"
  value       = aws_eks_node_group.mi_node_group.subnet_ids
}

output "eks_role_arn" {
  value = aws_iam_role.eks_role.arn
}

output "node_role_arn" {
  value = aws_iam_role.node_role.arn
}