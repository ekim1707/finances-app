module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.1.0"

    name = "${var.cluster_name}-vpc"
    cidr = var.vpc_cidr

    azs = ["${var.aws_region}a", "${var.aws_region}b"]
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets

    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "${var.cluster_name}-vpc"
        Environment = "dev"
    }
}

module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "20.34.0"
    
    cluster_name = var.cluster_name
    cluster_version = "1.29"

    subnet_ids = module.vpc.private_subnets
    vpc_id = module.vpc.vpc_id
    
    eks_managed_node_groups = {
        default = {
            desired_size = 2
            max_size = 3
            min_size = 1

            instance_types = ["t3.medium"]
        }
    }

    tags = {
        Name = var.cluster_name
        Environment = "dev"
    }
}

resource "aws_ecr_repository" "services" {
    for_each = toset(var.services)

    name = each.key

    image_scanning_configuration {
        scan_on_push = true
    }

    tags = {
        Name = each.key
        Environment = "dev"
    }
}