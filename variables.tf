variable "project_id" {
  description = "value of project name"
  type = string
}

variable "region" {
  description = "value of project region"
  type = string
}

variable "env" {
  description = "application environment"
  type = string
}

variable "service_account_id" {
  description = "ID of the service account"
  type = string
}

variable "input_topic" {
  description = "Topic that will receive the input"
  type = string
}

variable "output_topic" {
  description = "Topic responsible for receiving the output"
  type = string
}

variable "cloud_function_name" {
  description = "Name of the function for the cloud function"
  type = string
}

variable "bucket_name" {
  description = "Bucket name"
  type = string
}

variable "dataset_id" {
  description = "Dataset ID"
  type = string
}

variable "view_id" {
  description = "View ID"
  type = string
}

variable "table_id" {
  description = "Table ID"
  type = string
}

variable "message_retention_duration" {
  description = "Message retention duration for pub/sub"
  type = string
}