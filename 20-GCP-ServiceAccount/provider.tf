// Google Provider
provider "google" {
  credentials = file("/root/.gcp-account.json")
  project     = var.project_id
  region      = var.region
}