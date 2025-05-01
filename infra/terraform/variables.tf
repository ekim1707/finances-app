variable "aws_region" {
  description = "AWS region to deploy resources."
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "finances-app-cluster-v2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "List of public subnet CIDRs."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "node_instance_types" {
  description = "EC2 instance types for the node group"
  type = list(string)
  default = ["t3.medium"]
}

variable "services" {
  description = "List of service names for ECR repositories."
  type        = list(string)
  default     = ["frontend", "spending"]
}

variable "private_route_table_ids" {
  type = list(string)
  description = "List of private route table IDs to associate with private subnets"
}

variable "public_route_table_ids" {
  type = list(string)
  description = "List of public route table IDs to associate with private subnets"
}

variable "internet_gateway_id" {
  type = string
  description = "The ID of the Internet Gateway to attach public route tables to."
}
