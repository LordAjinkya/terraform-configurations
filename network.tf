resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_conf.cidr_block
  tags = { Name = "TerraformVPC" }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.subnet_conf[0].cidr_block
  map_public_ip_on_launch = var.subnet_conf[0].map_public_ip_on_launch
  availability_zone       = var.subnet_conf[0].availability_zone
  tags = { Name = "terraformPublicSubnet" }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_conf[1].cidr_block
  availability_zone = var.subnet_conf[1].availability_zone
  tags = { Name = "terraformPrivateSubnet" }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_conf[2].cidr_block
  availability_zone = var.subnet_conf[2].availability_zone
  tags = { Name = "terraformPrivateSubnet1" }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_conf[3].cidr_block
  availability_zone = var.subnet_conf[3].availability_zone
  tags = { Name = "terraformPrivateSubnet2" }
}