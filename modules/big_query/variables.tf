locals {
  time_partitioning_type = "MONTH"
}

variable "project_id" {
  description = "value of project name"
  type = string
}

variable "location" {
  description = "value of project region"
  default = "us-east4"
  type = string
}

variable "dataset_id" {
  description = "value of dataset id"
  type = string
}

variable "table_id" {
  description = "value of table id"
  type = string
}

variable "view_id" {
  description = "value of table id"
  type = string
}