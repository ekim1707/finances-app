resource "aws_db_subnet_group" "default" {
  name       = "main-subnet-group"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "Main DB subnet group"
  }
}

resource "aws_db_instance" "postgres" {
  identifier             = "my-postgres-db"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "15"
  instance_class         = "db.t3.micro"
  username               = "ekim1707"
  password               = "pdKingdom23!"
  publicly_accessible    = true
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.ec2.id]
}
