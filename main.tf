terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.project_id
}

resource "google_project_service" "services" {
  for_each = toset([
    "pubsub.googleapis.com",
    "bigquery.googleapis.com",
    "aiplatform.googleapis.com",
    "storage.googleapis.com",
    "storage-component.googleapis.com",
    "iamcredentials.googleapis.com",
    "cloudfunctions.googleapis.com",
    "eventarc.googleapis.com"
  ])

  service = each.key

  disable_on_destroy = true
}

# Instance only needed modules
module "storage" {
  source       = "./modules/storage"  
  region       = var.region
  bucket_name  = var.bucket_name
  project_id   = var.project_id
  env          = var.env
}

module "pub_sub" {
  source                     = "./modules/pub_sub"  
  project_id                 = var.project_id
  env                        = var.env
  ack_deadline_seconds       = 1
  input_topic                = var.input_topic
  output_topic               = var.output_topic
  message_retention_duration = var.message_retention_duration
}

module "cloud_function" {
  source                = "./modules/cloud_functions"  
  project_id            = var.project_id
  region                = var.region
  service_account       = module.service_account.service_account
  bucket_name           = module.storage.bucket_name
  env                   = var.env
  clound_function_name  = var.cloud_function_name
  pub_sub_topic         = module.pub_sub.input_topic
}

module "big_query" {
  source       = "./modules/big_query"  
  project_id   = var.project_id
  dataset_id   = var.dataset_id
  view_id      = var.view_id
  table_id     = var.table_id
  env          = var.env
}

module "service_account" {
  source             = "./modules/service_account"  
  project_id         = var.project_id
  service_account_id = var.service_account_id
}
