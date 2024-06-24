# Topics
resource "google_pubsub_topic" "ps_client_moderation_input_tst" {
  name    = local.input_function
  project = var.project_id
}

resource "google_pubsub_topic" "ps_client_moderation_output_tst" {
  name    = local.output_function
  project = var.project_id
}

# Subscriptions
resource "google_pubsub_subscription" "ps_client_moderation_input_tst_sub" {
  ack_deadline_seconds = local.ack_deadline_seconds

  expiration_policy {
    ttl = "2678400s"
  }

  message_retention_duration = local.message_retention_duration
  name                       = "${local.input_function}_sub"
  project                    = var.project_id
  topic                      = google_pubsub_topic.ps_client_moderation_input_tst.name
}

resource "google_pubsub_subscription" "enjoei_message_evaluate_output_topic_sub" {
  ack_deadline_seconds = local.ack_deadline_seconds

  expiration_policy {
    ttl = "2678400s"
  }

  message_retention_duration = local.message_retention_duration
  name                       = "${local.output_function}_sub"
  project                    = var.project_id
  topic                      = google_pubsub_topic.ps_client_moderation_output_tst.name
}

# EventArc
# resource "google_pubsub_subscription" "eventarc_us_east4_enjoei_message_evaluate_input_cloud_function_458727_sub_933" {
#   ack_deadline_seconds = local.ack_deadline_seconds_event_arc

#   labels = {
#     goog-drz-eventarc-location = var.location
#     goog-drz-eventarc-uuid     = "a87043bd-a30b-4272-b70d-914c00fc4ec3"
#     goog-eventarc              = ""
#   }

#   message_retention_duration = local.message_retention_duration
#   name                       = "eventarc-${var.location}-${local.input_function}-458727-sub-933"
#   project                    = var.project_id

#   push_config {
#     oidc_token {
#       audience              = "https://${local.input_function}-sn2decmlwa-uk.a.run.app"
#       service_account_email = var.service_account_email
#     }

#   # Revisar isso no futuro
#     push_endpoint = "https://${local.input_function}-sn2decmlwa-uk.a.run.app?__GCP_CloudEventsMode=CUSTOM_PUBSUB_projects%2Fgcp-warmup-enjoei%2Ftopics%2Fenjoei_message_evaluate_input_topic"
#   }

#   retry_policy {
#     maximum_backoff = "600s"
#     minimum_backoff = "10s"
#   }

#   topic = google_pubsub_topic.ps_client_moderation_input_tst.name
# }

# resource "google_pubsub_subscription" "eventarc_ouput_cloud_function" {
#   ack_deadline_seconds       = local.ack_deadline_seconds_event_arc
#   message_retention_duration = local.message_retention_duration
#   name                       = "eventarc-${var.location}-${local.output_function}"
#   project                    = var.project_id

#   push_config {
#     oidc_token {
#       audience              = "https://enjoei-message-evaluate-input-cloud-function-test-sn2decmlwa-uk.a.run.app"
#       service_account_email = var.service_account_email
#     }
    
#   # Revisar isso no futuro
#     push_endpoint = "https://${var.location}-${var.project_id}.cloudfunctions.net/${local.input_function}"
#   }

#   retry_policy {
#     maximum_backoff = "600s"
#     minimum_backoff = "10s"
#   }

#   topic = google_pubsub_topic.ps_client_moderation_output_tst.name
# }