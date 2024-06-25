locals {
  time_partitioning_type = "MONTH"
}

variable "project_id" {
  description = "value of project name"
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

variable "env" {
  description = "application environment"
  type = string
}