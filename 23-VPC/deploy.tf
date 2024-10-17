// Google Provider
provider "google" {
  credentials = file("/root/.gcp-account.json")
  project     = "cognixia-1607499012052"
  region      = "us-central1"
}


resource "google_compute_network" "myvpc" {
  name = var.myvpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
  description = "This module create a VPC with Auto Subnets"
}

variable "myvpc_name" {
  type        = string
  default     = "mytest-vpc"
  description = "My VPC Name"
}

variable "auto_create_subnetworks" {
  type = bool 
  default = "true"
}