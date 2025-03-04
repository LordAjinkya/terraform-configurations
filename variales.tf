variable "region" {
  description = "region for aws infra"
}

variable "rds_conf" {
  description = "rds configuration values"
}

variable "ec2_conf" {
  description = "EC2 configuration values"
  type = object({
    ami           = string
    instance_type = string
    key_name      = string
  })
}

variable "vpc_conf" {
  description = "VPC configuration values"
  type = object({
    cidr_block = string
  })
}

variable "subnet_conf" {
  description = "Subnet configuration values"
  type = list(object({
    cidr_block              = string
    map_public_ip_on_launch = bool
    availability_zone       = string
  }))
}

variable "igw_conf" {
  description = "Internet Gateway configuration values"
}

variable "route_table_conf" {
  description = "Route table configuration values"
  type = object({
    cidr_block = string
  })
}

variable "security_group_conf" {
  description = "Security group configuration values"
  type = list(object({
    name    = string
    ingress = list(object({
      from_port = number
      to_port   = number
      protocol  = string
      cidr_blocks = list(string)
    }))
    egress = list(object({
      from_port = number
      to_port   = number
      protocol  = string
      cidr_blocks = list(string)
    }))
  }))
}