resource "google_storage_bucket" "bucket_resource" {
  force_destroy               = false
  location                    = var.location
  name                        = var.bucket_name
  project                     = var.project_id
  public_access_prevention    = "enforced"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
