variable "mi_subnet" {
  description = "Lista subnet"
  type = list(string)
}

variable "app_replicas" {
  description = "2"
  type        = number
  default     = 2
}

variable "vpc_id" {
  description = "vpc-0889bae2746549098"
  type        = string
}

variable "security_group_ids" {
  description = "sg-003a42ddbcb9cf824"
  type        = list(string)
}

variable "cluster_name" {
  description = "Vote-Cat-Dog"
  type        = string
}

variable "aws_eks_cluster" {
  description = "mi-cluster"
  type = string  
}

variable "desired_capacity" {
  description = "2"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "2"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "4"
  type        = number
  default     = 4
}

