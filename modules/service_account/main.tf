resource "google_service_account" "service_account" {
  account_id   = var.service_account_id
  display_name = "App Engine default service account"
  project      = var.project_id
}

resource "google_project_iam_member" "service_account_iam" {
  project = var.project_id

  # place others roles here
  for_each = toset([
    "roles/source.admin"
  ])
  role    = each.key
  member  = "serviceAccount:${google_service_account.service_account.account_id}"
}
