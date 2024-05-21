output "standard_srv" {
    value = mongodbatlas_cluster.cluster.connection_strings[0].standard_srv
}

output "name" {
    value = mongodbatlas_cluster.cluster.name
}