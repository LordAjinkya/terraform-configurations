resource "aws_db_parameter_group" "rds_parameter_group" {
  name   = "my-rds-parameter-group"
  family = "mysql8.0"

  parameter {
    name         = "slow_query_log"
    value        = "1"
    apply_method = "immediate"
  }

  parameter {
    name         = "long_query_time"
    value        = "10"
    apply_method = "immediate"
  }

  tags = {
    Name = "My RDS Parameter Group"
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.rds_conf.identifier}-subnet-group"
  subnet_ids = [aws_subnet.private_subnet.id, aws_subnet.private_subnet_2.id]

  tags = {
    Name = "RDS Subnet Group"
  }
}

resource "aws_db_instance" "rds_mysql" {
  allocated_storage    = var.rds_conf.allocated_storage
  storage_type         = var.rds_conf.storage_type
  engine               = var.rds_conf.engine
  engine_version       = var.rds_conf.engine_version
  identifier           = var.rds_conf.identifier
  instance_class       = var.rds_conf.instance_class
  db_name              = var.rds_conf.db_name
  username             = var.rds_conf.username
  password             = var.rds_conf.password
  parameter_group_name = aws_db_parameter_group.rds_parameter_group.name # Reference the parameter group
  publicly_accessible  = var.rds_conf.publicly_accessible
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot  = var.rds_conf.skip_final_snapshot

  tags = { Name = "MyRDSInstance" }
}