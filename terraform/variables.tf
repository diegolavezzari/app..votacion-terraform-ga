variable "mi_subnet" {
  description = "subnet-0167d706fb101e2ae"
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

variable "desired_capacity" {
  description = "2"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "1"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "2"
  type        = number
  default     = 2
}

