resource "mongodbatlas_cluster" "cluster" {
  name                                    = var.cluster_name
  project_id                              = var.project_id
  pit_enabled                             = var.pit_backup_enabled
  cloud_backup                            = var.cloud_backup_enabled
  cluster_type                            = var.cluster_type
  auto_scaling_disk_gb_enabled            = var.auto_scaling_disk_gb_enabled
  auto_scaling_compute_enabled            = var.auto_scaling_compute_enabled
  termination_protection_enabled          = var.termination_protection_enabled
  auto_scaling_compute_scale_down_enabled = var.auto_scaling_compute_scale_down_enabled

  disk_size_gb                                    = var.disk_size_gb
  provider_name                                   = var.cloud_provider
  provider_region_name                            = var.region 
  mongo_db_major_version                          = var.mongodb_version
  provider_instance_size_name                     = var.instance_size
  provider_auto_scaling_compute_min_instance_size = var.min_instance_size
  provider_auto_scaling_compute_max_instance_size = var.max_instance_size

  dynamic "tags" {
    for_each = var.tags
    content {
      key     = tags.value.key
      value   = tags.value.value
    }
  }

  replication_specs {
    num_shards = var.num_shards
    regions_config {
      priority        = var.priority_in_region
      region_name     = var.region
      electable_nodes = var.electable_nodes_in_region
      read_only_nodes = var.read_only_nodes_in_region
      analytics_nodes = var.analytics_nodes_in_region
    }
  }

  /**
   * If auto_scaling_compute_enabled is true, then Atlas will automatically scale up to the 
   * maximum provided and down to the minimum, if provided. 
   *
   * This will cause the value of provider_instance_size_name returned to potentially be different 
   * than what is specified in the Terraform config and if one then applies a plan, not noting this
   * Terraform will scale the cluster back to the original instanceSizeName value. 
   *
   * To prevent this a lifecycle customization should be used, i.e.:
   * lifecycle { ignore_changes = [provider_instance_size_name] } 
   * 
   * But in order to explicitly change provider_instance_size_name comment the lifecycle block and run terraform apply. 
   * Please ensure to uncomment it to prevent any accidental changes.
   *
   * The same happens with disk_size_gb if auto_scaling_disk_gb_enabled is set to true
  */
  lifecycle {
    ignore_changes = [
      provider_instance_size_name,
      disk_size_gb
    ]
  }
}