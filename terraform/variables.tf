variable "vpc_id" {
  description = "vpc-eks-vote"
  type        = string
  default     = "vpc-07501a4fd9aabe6b5"
}

variable "mi_subnet" {
  description = "subnet-eks-vote"
  type        = list(string)
  default     = [
    "subnet-0dc31742c5e7303b2", # Private subnet 1
    "subnet-073466fb88c926542", # Public subnet 1
    "subnet-022424d38893f82e2", # Private subnet 2
    "subnet-0804dd61a2ab23cbe"  # Public subnet 2
  ]
}

variable "security_group_ids" {
  description = "sg-eks-vote"
  type        = list(string)
}

variable "cluster_name" {
  description = "Vote-Cat-Dog-app"
  type        = string
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

variable "app_replicas" {
  description = "2"
  type        = number
  default     = 2
}