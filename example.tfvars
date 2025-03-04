region = "us-east-1"
rds_conf = {
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.micro"
  db_name               = "mydatabase"
  identifier            = "myTerraformRDS"
  username              = "admin"
  password              = "YourSecurePassword123"
  parameter_group_name  = "default.mysql8.0"
  publicly_accessible   = false  # Keep it private
  skip_final_snapshot   = true
}
