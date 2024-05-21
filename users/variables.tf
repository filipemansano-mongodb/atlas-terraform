variable "username" {
  description = "Nome de usuário para o banco de dados MongoDB Atlas."
  type        = string
}

variable "password" {
  description = "Senha para o banco de dados MongoDB Atlas."
  type        = string
  sensitive   = true
}

variable "project_id" {
  description = "ID do projeto no MongoDB Atlas."
  type        = string
}

variable "auth_database_name" {
  description = "Nome do banco de dados de autenticação. Padrão é 'admin'."
  type        = string
  default     = "admin"
}

variable "roles" {
  description = "Lista de roles para o usuário do banco de dados. Cada role deve ter o nome da role e o nome do banco de dados."
  type = list(object({
    role_name     = string
    database_name = string
  }))
}