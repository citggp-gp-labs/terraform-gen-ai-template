# Topics
resource "google_pubsub_topic" "ps_client_moderation_input_tst" {
  name    = var.input_topic
  project = var.project_id
}

resource "google_pubsub_topic" "ps_client_moderation_output_tst" {
  name    = var.output_topic
  project = var.project_id
}

# Subscriptions
resource "google_pubsub_subscription" "ps_client_moderation_input_tst_sub" {
  ack_deadline_seconds = var.ack_deadline_seconds

  expiration_policy {
    ttl = "2678400s"
  }

  message_retention_duration = var.message_retention_duration
  name                       = "${var.input_topic}_sub"
  project                    = var.project_id
  topic                      = google_pubsub_topic.ps_client_moderation_input_tst.name
}

resource "google_pubsub_subscription" "enjoei_message_evaluate_output_topic_sub" {
  ack_deadline_seconds = var.ack_deadline_seconds

  expiration_policy {
    ttl = "2678400s"
  }

  message_retention_duration = var.message_retention_duration
  name                       = "${var.output_topic}_sub"
  project                    = var.project_id
  topic                      = google_pubsub_topic.ps_client_moderation_output_tst.name
}
