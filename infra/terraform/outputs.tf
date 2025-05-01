output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.cluster_name
}

# output "node_role_arn" {
#   description = "The ARN of the node role."
#   value       = aws_iam_role.node_role.arn
# }

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}