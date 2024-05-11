resource "mongodbatlas_cluster" "cluster" {
  project_id                              = var.project_id
  name                                    = var.cluster_name
  cloud_backup                            = var.cloud_backup_enabled
  pit_enabled                             = var.pit_backup_enabled
  cluster_type                            = var.cluster_type
  auto_scaling_compute_enabled            = var.auto_scaling_compute_enabled
  auto_scaling_compute_scale_down_enabled = var.auto_scaling_compute_scale_down_enabled

  provider_name                                   = var.instance_size == "M0" ? "TENANT" : var.cloud_provider
  provider_instance_size_name                     = var.instance_size
  provider_auto_scaling_compute_min_instance_size = var.min_instance_size
  provider_auto_scaling_compute_max_instance_size = var.max_instance_size
  mongo_db_major_version = var.mongodb_version

  # necessarios para M0
  backing_provider_name = var.instance_size == "M0" ? var.cloud_provider : null
  provider_region_name  = var.instance_size == "M0" ? var.region1 : null

  replication_specs {
    num_shards = var.num_shards
    regions_config {
      region_name     = var.region1
      electable_nodes = var.electable_nodes_in_region_1
      priority        = var.priority_in_region_1
      read_only_nodes = var.read_only_nodes_in_region_1
      analytics_nodes = var.analytics_nodes_in_region_1
    }
  }
}