variable "public_key" {
  type        = string
  description = "Public Programmatic API key to authenticate to Atlas"
}

variable "private_key" {
  type        = string
  description = "Private Programmatic API key to authenticate to Atlas"
}

variable "org_id" {
  type        = string
  description = "MongoDB Organization ID"
}

variable "aws_access_key" {
  description = "The access key for AWS Account"
  type        = string
}

variable "aws_secret_key" {
  description = "The secret key for AWS Account"
  type        = string
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "users" {
  description = "Lista de usuários para o MongoDB Atlas. Cada usuário deve incluir username, password, auth_database_name e roles."
  type = list(object({
    username           = string
    password           = string
    roles = list(object({
      role_name     = string
      database_name = string
    }))
  }))
}