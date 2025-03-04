resource "aws_instance" "web_server" {
  ami             = "ami-0583d8c7a9c35822c"  # Update with your preferred AMI
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet.id
  key_name        = "my-ec2-key"
  security_groups = [aws_security_group.ec2_sg.id]

  tags = { Name = "deployed-using-terraformServer" }
}

