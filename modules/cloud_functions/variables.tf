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

variable "clound_function_name" {
  description = "name of the cloud function to be implemented"
  type = string
}

variable "pub_sub_topic" {
  description = "topic that will trigger this cloud function"
  type = string
}