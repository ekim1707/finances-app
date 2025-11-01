provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"
  name    = "my-vpc"
  cidr    = "10.0.0.0/16"

  azs              = ["us-east-1a", "us-east-1b"]
  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false
}

module "ec2_key_pair" {
  source     = "terraform-aws-modules/key-pair/aws"
  key_name   = "deploy_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "app" {
  ami                         = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type               = "t3.micro"
  key_name                    = "deploy_key"
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  security_groups             = [aws_security_group.ec2.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "docker-app-instance"
  }
}

resource "aws_security_group" "ec2" {
  name   = "ec2-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
