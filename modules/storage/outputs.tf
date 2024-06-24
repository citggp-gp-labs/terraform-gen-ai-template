output "bucket_name" {
    description = "bucket of the project, to be used in other modules"
  value = google_storage_bucket.bucket_resource.name
}
