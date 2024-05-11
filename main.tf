module "atlas_project" {
    source = "./project"
    org_id = var.org_id
    project_name = "demo"
}

module "cluster" {
    source = "./cluster"
    project_id = module.atlas_project.id
    cluster_name = "demo"
    cloud_backup_enabled = false
    pit_backup_enabled = false
    cluster_type = "REPLICASET"
    auto_scaling_compute_enabled = false
    auto_scaling_compute_scale_down_enabled = false
    cloud_provider = "AWS"
    instance_size = "M0"
    mongodb_version = "7.0"
    region1 = "US_EAST_1"
    electable_nodes_in_region_1 = 3
    priority_in_region_1 = 7
    read_only_nodes_in_region_1 = 0
    analytics_nodes_in_region_1 = 0
}

output "srv_uri" {
    value = module.cluster.standard_srv
}