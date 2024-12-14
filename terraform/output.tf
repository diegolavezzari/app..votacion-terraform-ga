output "cluster_name" {
  description = "Nombre del clúster EKS"
  value       = aws_eks_cluster.cluster_vote.name
}

output "node_group_name" {
  description = "Nombre del grupo de nodos EKS"
  value       = aws_eks_node_group.mi_node_group.node_group_name
}

output "node_group_subnet_ids" {
  description = "IDs de las subnets donde se encuentran los nodos"
  value       = aws_eks_node_group.mi_node_group.subnet_ids
}

output "cluster_endpoint" {
  description = "Endpoint del clúster EKS"
  value       = aws_eks_cluster.cluster_vote.endpoint
}

output "eks_role_arn" {
  value = aws_iam_role.eks_role.arn
}

output "node_role_arn" {
  value = aws_iam_role.node_role.arn
}