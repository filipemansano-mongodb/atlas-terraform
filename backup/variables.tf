variable "project_id" {
  description = "O ID do projeto para o cluster MongoDB Atlas"
  type        = string
}

variable "cluster_name" {
  description = "O nome do cluster MongoDB Atlas"
  type        = string
}

variable "reference_hour_of_day" {
  description = "Hora de referência do dia"
  type        = number
  default     = 3
}

variable "reference_minute_of_hour" {
  description = "Minuto de referência da hora"
  type        = number
  default     = 45
}

variable "restore_window_days" {
  description = "Dias da janela de restauração"
  type        = number
  default     = 4
}

variable "enable_hourly_policy" {
  description = "Habilitar política de backup horário"
  type        = bool
  default     = false
}

variable "hourly_frequency_interval" {
  description = "Intervalo de frequência para backups horários"
  type        = number
  default     = 1
}

variable "hourly_retention_unit" {
  description = "Unidade de retenção para backups horários"
  type        = string
  default     = "days"
}

variable "hourly_retention_value" {
  description = "Valor de retenção para backups horários"
  type        = number
  default     = 1
}

variable "enable_daily_policy" {
  description = "Habilitar política de backup diário"
  type        = bool
  default     = false
}

variable "daily_frequency_interval" {
  description = "Intervalo de frequência para backups diários"
  type        = number
  default     = 1
}

variable "daily_retention_unit" {
  description = "Unidade de retenção para backups diários"
  type        = string
  default     = "days"
}

variable "daily_retention_value" {
  description = "Valor de retenção para backups diários"
  type        = number
  default     = 2
}

variable "enable_weekly_policy" {
  description = "Habilitar política de backup semanal"
  type        = bool
  default     = false
}

variable "weekly_frequency_interval" {
  description = "Intervalo de frequência para backups semanais"
  type        = number
  default     = 4
}

variable "weekly_retention_unit" {
  description = "Unidade de retenção para backups semanais"
  type        = string
  default     = "weeks"
}

variable "weekly_retention_value" {
  description = "Valor de retenção para backups semanais"
  type        = number
  default     = 3
}

variable "enable_monthly_policy" {
  description = "Habilitar política de backup mensal"
  type        = bool
  default     = false
}

variable "monthly_frequency_interval" {
  description = "Intervalo de frequência para backups mensais"
  type        = number
  default     = 5
}

variable "monthly_retention_unit" {
  description = "Unidade de retenção para backups mensais"
  type        = string
  default     = "months"
}

variable "monthly_retention_value" {
  description = "Valor de retenção para backups mensais"
  type        = number
  default     = 4
}