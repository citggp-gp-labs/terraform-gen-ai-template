data "google_iam_policy" "admin" {
  binding {
    role = "roles/editor"
    
    # add members here
    members = [
      "user:placeholder@email.com",
    ]
  }
}

resource "google_project_iam_binding" "project" {
  project = var.project_id
  role    = "roles/editor"

  # add members here
  members = [
    "user:placeholder@email.com",
  ]
}

