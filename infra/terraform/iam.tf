# resource "aws_iam_role" "eks_worker_role" {
#   name = "eks_worker_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#       },
#     ]
#   })

#   tags = {
#     Name        = "eks_worker_role"
#     Environment = "dev"
#   }
# }

# resource "aws_iam_role" "node_role" {
#   name               = "${var.cluster_name}-node-role"
#   assume_role_policy = data.aws_iam_policy_document.eks_node_assume_role_policy.json
# }

# data "aws_iam_policy_document" "eks_node_assume_role_policy" {
#   statement {
#     actions = [
#       "sts:AssumeRole",
#     ]
#     principals {
#       type        = "Service"
#       identifiers = ["ec2.amazonaws.com"]
#     }
#   }
# }

# resource "aws_iam_role_policy_attachment" "eks_worker_policy_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
#   role       = aws_iam_role.eks_worker_role.name
# }

# resource "aws_iam_role_policy_attachment" "eks_CNI_policy_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
#   role       = aws_iam_role.eks_worker_role.name
# }

# resource "aws_iam_role_policy_attachment" "eks_vpc_policy_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
#   role       = aws_iam_role.eks_worker_role.name
# }
