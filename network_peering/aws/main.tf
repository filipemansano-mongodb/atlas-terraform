resource "mongodbatlas_network_peering" "aws-atlas" {
  accepter_region_name   = var.aws_region
  project_id             = mongodbatlas_project.project.id
  container_id           = mongodbatlas_cluster.cluster.container_id
  provider_name          = "AWS"
  route_table_cidr_block = var.aws_vpc_cidr
  vpc_id                 = var.aws_vpc_id
  aws_account_id         = var.aws_account_id
}

resource "mongodbatlas_project_ip_access_list" "test" {
  project_id = mongodbatlas_project.project.id
  cidr_block = var.aws_vpc_cidr
  comment    = "cidr block for AWS VPC"
}