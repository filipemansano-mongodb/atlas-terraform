module "project" {
    source       = "./project"
    org_id       = var.org_id
    project_name = "demo"
}

module "cluster" {
    source                                  = "./cluster"
    cluster_name                            = "demo"
    project_id                              = module.project.id
    cloud_provider                          = "AWS"
    region                                  = "US_EAST_1"
    cluster_type                            = "REPLICASET"
    disk_size_gb                            = 10
    instance_size                           = "M10"
    min_instance_size                       = "M10"
    max_instance_size                       = "M30"
    mongodb_version                         = "7.0"
    electable_nodes_in_region               = 3
    priority_in_region                      = 7
    read_only_nodes_in_region               = 0
    analytics_nodes_in_region               = 0
    cloud_backup_enabled                    = true
    pit_backup_enabled                      = true
    termination_protection_enabled          = true
    auto_scaling_disk_gb_enabled            = true
    auto_scaling_compute_enabled            = true
    auto_scaling_compute_scale_down_enabled = true
    tags = [
        {
            key: "environment"
            value: "development"
        }
    ]
}

module "private_link" {
    source                  = "./network/private-link/aws"
    region                  = "US_EAST_1"
    project_id              = module.project.id
    create_aws_resources    = false
    vpc_id                  = "vpc-<ID>"
    subnet_ids              = ["subnet-<ID>", "subnet-<ID>", "subnet-<ID>"]
    security_group_ids      = ["sg-<ID>"]
}

module "backup" {
    source                     = "./backup"
    project_id                 = module.project.id
    cluster_name               = module.cluster.name
    reference_hour_of_day      = 3
    reference_minute_of_hour   = 45
    restore_window_days        = 4

    enable_hourly_policy       = true
    hourly_frequency_interval  = 1
    hourly_retention_unit      = "days"
    hourly_retention_value     = 4

    enable_daily_policy        = true
    daily_frequency_interval   = 1
    daily_retention_unit       = "days"
    daily_retention_value      = 4

    enable_weekly_policy       = true
    weekly_frequency_interval  = 4
    weekly_retention_unit      = "weeks"
    weekly_retention_value     = 3

    enable_monthly_policy      = true
    monthly_frequency_interval = 5
    monthly_retention_unit     = "months"
    monthly_retention_value    = 4
}

module "users" {
    source             = "./users"
    for_each           = { for user in var.users : user.username => user }
    username           = each.value.username
    password           = each.value.password
    project_id         = module.project.id
    roles              = each.value.roles
}

output "srv_uri" {
    value = module.cluster.standard_srv
}