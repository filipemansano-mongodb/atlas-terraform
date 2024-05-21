variable "project_id" {
  type        = string
  description = "The ID of the project to create the cluster in."
}

variable "cloud_backup_enabled" {
  type        = bool
  description = "Enable cloud backup for the cluster."
  default     = true
}

variable "pit_backup_enabled" {
  type        = bool
  description = "Enable point in time (continuous) backup for the cluster. Cloud Backup must be enabled to avail this feature."
  default     = true
}

variable "auto_scaling_compute_enabled" {
  type        = bool
  description = "Enable cluster to up scale automatically based on compute."
  default     = false
}

variable "termination_protection_enabled" {
  type        = bool
  description = "Flag that indicates whether termination protection is enabled on the cluster"
  default     = true
}

variable "paused" {
  type        = bool
  description = "pause or unpause the cluster."
  default     = true
}

variable "auto_scaling_compute_scale_down_enabled" {
  type        = bool
  description = "Enable cluster to down scale automatically based on compute."
  default     = true
}

variable "auto_scaling_disk_gb_enabled" {
  type        = bool
  description = "Enable disk to up scale automatically based on size."
  default     = true
}

variable "mongodb_version" {
  type        = string
  description = "The Major MongoDB version"
  default     = "7.0"
}

variable "cloud_provider" {
  type        = string
  description = "The cloud provider to use, must be AWS, GCP AZURE or TENANT"
  default     = "AWS"
}

variable "instance_size" {
  type        = string
  description = "Instance Size of the cluster."
  default     = "M0"
}

variable "min_instance_size" {
  type        = string
  description = "Minimum tier the cluster can auto scaled to."
  default     = "M0"
}

variable "max_instance_size" {
  type        = string
  description = "Maximum tier the cluster can auto scaled to."
  default     = "M10"
}

variable "region" {
  type        = string
  description = "MongoDb Atlas Cluster Region 1, must be a region for the provider given"
  default     = "US_EAST_1"
}

variable "electable_nodes_in_region" {
  type        = number
  description = "Number of electable nodes in region 1."
  default     = 3
}

variable "priority_in_region" {
  type        = number
  description = "Priority of electable nodes in region 1."
  default     = 7
}

variable "read_only_nodes_in_region" {
  type        = number
  description = "Number of read-only nodes in region 1."
  default     = 0
}

variable "analytics_nodes_in_region" {
  type        = number
  description = "Number of analytic nodes in region 1."
  default     = 0
}

variable "num_shards" {
  type        = number
  description = "Number of shards in the cluster."
  default     = 1
}

variable "disk_size_gb" {
  type        = number
  description = "Disk size GB"
  default     = 10
}

variable "cluster_type" {
  type        = string
  description = "Type of the cluster, must be REPLICASET or SHARDED"
  default     = "REPLICASET"
}

variable "cluster_name" {
  type        = string
  description = "Name of the cluster to be created."
}

variable "tags" {
  description = "Lista de tags."
  type = list(object({
    key     = string
    value = string
  }))
}