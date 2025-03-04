resource "aws_instance" "web_server" {
  ami           = var.ec2_conf.ami
  instance_type = var.ec2_conf.instance_type
  subnet_id      = aws_subnet.public_subnet.id
  key_name      = var.ec2_conf.key_name
  security_groups = [aws_security_group.ec2_sg.id]

  tags = { Name = "deployed-using-terraformServer" }
}