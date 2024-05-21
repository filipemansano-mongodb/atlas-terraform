locals {
  subnet_ids            = var.create_aws_resources ? [aws_subnet.subnet_east_a[0].id, aws_subnet.subnet_east_b[0].id] : var.subnet_ids
  security_group_ids    = var.create_aws_resources ? [aws_security_group.sg_east[0].id] : var.security_group_ids
  vpc_id                = var.create_aws_resources ? aws_vpc.vpc_east[0].id : var.vpc_id
  create_aws_resources  = var.create_aws_resources ? 1 : 0
}

resource "aws_vpc_endpoint" "vpce_east" {
  vpc_id             = local.vpc_id
  subnet_ids         = local.subnet_ids
  security_group_ids = local.security_group_ids
  service_name       = mongodbatlas_privatelink_endpoint.pe_east.endpoint_service_name
  vpc_endpoint_type  = "Interface"
}

resource "aws_vpc" "vpc_east" {
  count                = local.create_aws_resources
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "ig_east" {
  count  = local.create_aws_resources
  vpc_id = local.vpc_id
}

resource "aws_route" "route_east" {
  count                  = local.create_aws_resources
  route_table_id         = aws_vpc.vpc_east[0].main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig_east[0].id
}

resource "aws_subnet" "subnet_east_a" {
  count                   = local.create_aws_resources
  vpc_id                  = local.vpc_id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
}

resource "aws_subnet" "subnet_east_b" {
  count                   = local.create_aws_resources
  vpc_id                  = local.vpc_id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1b"
}

resource "aws_security_group" "sg_east" {
  count       = local.create_aws_resources
  name_prefix = "default-"
  description = "Default security group for all instances in vpc"
  vpc_id      = local.vpc_id
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}