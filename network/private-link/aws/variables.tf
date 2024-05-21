variable "region" {
  type        = string
  description = "AWS Region"
}

variable "project_id" {
  description = "Atlas project ID"
  type        = string
}

variable "create_aws_resources" {
  description = "Flag to identify if need create the VPC, SG and SubNets"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "VPC Id"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "List of subnets id"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of security groups id"
  type        = list(string)
  default     = []
}