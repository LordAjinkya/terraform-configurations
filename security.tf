resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.main_vpc.id

  dynamic "ingress" {
    for_each = var.security_group_conf[0].ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.security_group_conf[0].egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = { Name = "terraform-server-SG" }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.main_vpc.id

  dynamic "ingress" {
    for_each = var.security_group_conf[1].ingress
    content {
      from_port = ingress.value.from_port
      to_port   = ingress.value.to_port
      protocol  = ingress.value.protocol
      security_groups = ingress.value.security_groups
    }
  }

  dynamic "egress" {
    for_each = var.security_group_conf[1].egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = { Name = "terraform-RDS-SG" }
}