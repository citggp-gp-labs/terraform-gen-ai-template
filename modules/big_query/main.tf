resource "google_bigquery_table" "products" {
  dataset_id = var.dataset_id
  project    = var.project_id
  table_id   = var.table_id
  time_partitioning {
    field = "created_at"
    type  = local.time_partitioning_type
  }

  labels = {
    env = var.env
  }
}

resource "google_bigquery_table" "message_logs_view" {
  dataset_id = var.dataset_id
  project    = var.project_id
  table_id   = var.view_id

  view {
    query          = ""
    use_legacy_sql = false
  }

  labels = {
    env = var.env
  }
}
