resource "mongodbatlas_project" "project" {
    name   = var.project_name
    org_id = var.org_id
}