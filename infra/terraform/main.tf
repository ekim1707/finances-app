provider "aws" {
  region = var.aws_region
}

# Create a VPC using the official AWS module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = "${var.cluster_name}-vpc"
  cidr = var.vpc_cidr

  azs = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name        = "${var.cluster_name}-vpc"
  }
}

# Create the EKS cluster
module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "20.34.0"
  
  cluster_name = var.cluster_name
  cluster_version = "1.29"
  subnet_ids = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id

  eks_managed_node_groups = {
    default = {
      desired_size = 1
      max_size     = 1
      min_size     = 1

      instance_types = ["t3.medium"]
      capacity_type = "ON_DEMAND"
    }
  }
  tags = {
    Project        = "finances-app"
    Environment = "dev"
  }

    # Allow the module to manage `aws-auth` automatically
    enable_irsa = true
      enable_cluster_creator_admin_permissions = false

  # Add this block to grant IAM user access:
access_entries = {
  admin = {
    principal_arn = "arn:aws:iam::504347844373:user/Admin"
    type          = "STANDARD"

    policy_associations = {
      admin = {
        policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
        access_scope = {
          type = "cluster"
        }
      }
    }
  }
}
}

# resource "aws_eks_node_group" "default" {
#   cluster_name    = module.eks.cluster_name
#   node_group_name = "default"
#   node_role_arn   = aws_iam_role.node_role.arn
#   subnet_ids      = module.vpc.private_subnets
#   instance_types  = ["t3.micro"]

#   scaling_config {
#     desired_size = 1
#     max_size     = 1
#     min_size     = 1
#   }

#   tags = {
#     Name        = "default-node-group"
#     Environment = "dev"
#   }
# }

# # Elastic IP for NAT Gateway
# resource "aws_eip" "nat" {
#   domain = "vpc"
# }

# # NAT Gateway
# resource "aws_nat_gateway" "this" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = "subnet-097f221eea163f47e" # Replace with your actual public subnet id
# }

# # Update PRIVATE Route Tables to use NAT Gateway
# resource "aws_route" "private_nat_gateway" {
#   count                  = length(var.private_route_table_ids)
#   route_table_id         = var.private_route_table_ids[count.index]
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.this.id
# }

# # Update PUBLIC Route Tables to use Internet Gateway
# resource "aws_route" "public_internet_gateway" {
#   count                  = length(var.public_route_table_ids)
#   route_table_id         = var.public_route_table_ids[count.index]
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = var.internet_gateway_id
# }
