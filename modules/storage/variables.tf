variable "project_id" {
  description = "value of project name"
  type = string
}

variable "location" {
  description = "value of project region"
  default = "us-east4"
  type = string
}

variable "bucket_name" {
  description = "value of bucket name"
  default = "test_bucket_name"
  type = string
}