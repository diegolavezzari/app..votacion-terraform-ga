# Nombre del clúster EKS
cluster_name = "Vote-Cat-Dog"

# IDs de subnets
mi_subnet = ["subnet-0167d706fb101e2ae"]

# Número de réplicas para la aplicación
app_replicas = 3

# ID de la VPC
vpc_id = "vpc-0889bae2746549098"

# IDs de grupos de seguridad
security_group_ids = ["sg-003a42ddbcb9cf824"]

# Configuración del grupo de nodos
desired_capacity = 2
min_size         = 1
max_size         = 2
