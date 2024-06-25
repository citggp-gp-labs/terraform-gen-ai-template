variable "project_id" {
  description = "value of project name"
  type = string
}

variable "region" {
  description = "value of project region"
  type = string
}

variable "service_account" {
  description = "value of service account"
  type = string
}

variable "bucket_name" {
  description = "Bucket name to be used, it will be used from other module"
  type = string
}

variable "env" {
  description = "application environment"
  type = string
}

locals {
  input_function = "ps-client-moderation-input-tst"
  output_function = "ps-client-moderation-output-tst"
  message_retention_duration = "604800s"
  ack_deadline_seconds = 10
  ack_deadline_seconds_event_arc = 600
}
