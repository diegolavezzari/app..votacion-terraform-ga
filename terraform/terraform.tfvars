# Nombre del clúster EKS
cluster_name = "Vote-Cat-Dog"

# IDs de subnets
mi_subnet = [
  "subnet-0dc31742c5e7303b2", # Private subnet 1
  "subnet-073466fb88c926542", # Public subnet 1
  "subnet-022424d38893f82e2", # Private subnet 2
  "subnet-0804dd61a2ab23cbe"  # Public subnet 2
]

# Número de réplicas para la aplicación
app_replicas = 3

# ID de la VPC
vpc_id = "vpc-07501a4fd9aabe6b5"

# IDs de grupos de seguridad
security_group_ids = []

# Configuración del grupo de nodos
desired_capacity = 2
min_size         = 1
max_size         = 2
