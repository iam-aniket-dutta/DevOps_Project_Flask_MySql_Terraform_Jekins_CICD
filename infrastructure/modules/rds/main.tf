
#  Define db sunnet groups
resource "aws_db_subnet_group" "db_sb_grp" {
  subnet_ids = var.subnet_ids
  tags = {
    Name      = "db-sb-grp"
    CreatedBy = var.created_by
  }
}

resource "aws_db_instance" "rds" {
  engine                  = "mysql"
  engine_version          = "8.0.43"
  identifier              = "mysql"       # DB instance name
  instance_class          = "db.t3.micro" # Define db instance type
  storage_type            = "gp2"
  allocated_storage       = 10
  db_subnet_group_name    = aws_db_subnet_group.db_sb_grp.name
  vpc_security_group_ids  = [var.sg_name_for_rds]
  username                = var.db_user
  password                = var.db_password
  db_name                 = var.db_database
  skip_final_snapshot     = true
  apply_immediately       = true
  backup_retention_period = 0
  deletion_protection     = false

  tags = {
    Name      = "flask-db-instance"
    CreatedBy = var.created_by
  }
}
