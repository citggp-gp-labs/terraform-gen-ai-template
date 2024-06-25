resource "google_storage_bucket_object" "bucket_object" {
  name   = "function-source"
  bucket = var.bucket_name
  source = "function-source.zip"  # Add path to the zipped function source code
}

resource "google_cloudfunctions2_function" "model_evaluate_function" {
  name        = "model_evaluate_function"
  location    = var.region
  description = "Function that will call the model for evaluation"

  build_config {
    runtime     = "python312"
    entry_point = "retrieve_messages" 
    environment_variables = {
      BUILD_CONFIG_TEST = "build_test"
    }
    source {
      storage_source {
        bucket = var.bucket_name
        object = google_storage_bucket_object.bucket_object.name
      }
    }
  }

  service_config {
    max_instance_count = 3
    min_instance_count = 1
    available_memory   = "256M"
    timeout_seconds    = 60
    environment_variables = {
      SERVICE_CONFIG_TEST = "config_test"
    }
    ingress_settings               = "ALLOW_INTERNAL_ONLY"
    all_traffic_on_latest_revision = true
    service_account_email          = var.service_account
  }

  event_trigger {
    trigger_region = var.region
    event_type     = "google.cloud.pubsub.topic.v1.messagePublished"
    pubsub_topic   = google_pubsub_topic.ps_client_moderation_input_tst.name
    retry_policy   = "RETRY_POLICY_RETRY"
  }
}

# https://cloud.google.com/functions/docs/tutorials/terraform-pubsub

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function