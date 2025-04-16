output "eks_cluster_name" {
    description = "EKS cluster name"
    value = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
    description = "EKS cluster endpoint"
    value = module.eks.cluster_endpoint
}

output "eks_cluster_security_group_id" {
    description = "ECR repository URLs"
    value = {
        for repo in aws_ecr_repository.services :
        repo.name => repo.repository_url
    }
}