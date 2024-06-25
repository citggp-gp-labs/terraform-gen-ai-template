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
  bucket_name  = "bucket_name"
  project_id   = var.project_id
  env          = var.env
}

module "pub_sub_cloud_function" {
  source                = "./modules/pub_sub_cloud_functions"  
  project_id            = var.project_id
  region                = var.region
  service_account       = ""
  service_account_email = ""
  bucket_name           = module.storage.bucket_name
  env                   = var.env
}

module "big_query" {
  source       = "./modules/big_query"  
  project_id   = var.project_id
  region       = var.region
  dataset_id   = "dataset_test"
  view_id      = "view_test"
  table_id     = "table_test"
  env          = var.env
}

module "service_account" {
  source             = "./modules/service_account"  
  project_id         = var.project_id
  service_account_id = "teste-id"
}
