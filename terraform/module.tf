module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  # Nombre del clúster
  cluster_name    = var.cluster_name
  cluster_version = "1.31"

  # Habilitar acceso público al endpoint del clúster
  cluster_endpoint_public_access = true

  # Permisos administrativos al creador del clúster
  enable_cluster_creator_admin_permissions = true

  # Subnets y VPC
  vpc_id     = var.vpc_id
  subnet_ids = var.mi_subnet

  # Tags opcionales
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
