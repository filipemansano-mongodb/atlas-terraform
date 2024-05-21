resource "mongodbatlas_cloud_backup_schedule" "backup" {
  project_id   = var.project_id
  cluster_name = var.cluster_name

  reference_hour_of_day    = var.reference_hour_of_day
  reference_minute_of_hour = var.reference_minute_of_hour
  restore_window_days      = var.restore_window_days

  dynamic "policy_item_hourly" {
    for_each = var.enable_hourly_policy ? [1] : []
    content {
      frequency_interval = var.hourly_frequency_interval
      retention_unit     = var.hourly_retention_unit
      retention_value    = var.hourly_retention_value
    }
  }

  dynamic "policy_item_daily" {
    for_each = var.enable_daily_policy ? [1] : []
    content {
      frequency_interval = var.daily_frequency_interval
      retention_unit     = var.daily_retention_unit
      retention_value    = var.daily_retention_value
    }
  }

  dynamic "policy_item_weekly" {
    for_each = var.enable_weekly_policy ? [1] : []
    content {
      frequency_interval = var.weekly_frequency_interval
      retention_unit     = var.weekly_retention_unit
      retention_value    = var.weekly_retention_value
    }
  }

  dynamic "policy_item_monthly" {
    for_each = var.enable_monthly_policy ? [1] : []
    content {
      frequency_interval = var.monthly_frequency_interval
      retention_unit     = var.monthly_retention_unit
      retention_value    = var.monthly_retention_value
    }
  }
}
