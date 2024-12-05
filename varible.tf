
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "eks_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.24"
}

variable "region" {
  description = "Region to deploy the resources"
  type        = string
  default     = "eu-west-3"
}


#========= ALB =========

variable "alb_name" {
  description = "Nom du Load Balancer applicatif"
  type        = string
  default     = "grp4-alb"
}

variable "alb_ports" {
  description = "Liste des ports pour le Load Balancer"
  type        = list(number)
  default     = [80, 443]
}


