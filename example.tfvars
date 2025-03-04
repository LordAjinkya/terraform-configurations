region = "us-east-1"

rds_conf = {
  # ... (existing RDS configuration)
}

ec2_conf = {
  ami           = "ami-0583d8c7a9c35822c"
  instance_type = "t2.micro"
  key_name      = "my-ec2-key"
}

vpc_conf = {
  cidr_block = "10.0.0.0/16"
}

subnet_conf = [
  {
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1a"
  },
  {
    cidr_block              = "10.0.2.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-east-1b"
  },
  {
    cidr_block              = "10.0.4.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-east-1b"
  },
  {
    cidr_block              = "10.0.3.0/24"
    map_public_ip_on_launch = false
    availability_zone       = "us-east-1c"
  }
]

igw_conf = {}

route_table_conf = {
  cidr_block = "0.0.0.0/0"
}

security_group_conf = [
  {
    name = "ec2-sg"
    ingress = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  {
    name = "rds-sg"
    ingress = [
      {
        from_port = 3306
        to_port   = 3306
        protocol  = "tcp"
        security_groups = ["${aws_security_group.ec2_sg.id}"]
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
]