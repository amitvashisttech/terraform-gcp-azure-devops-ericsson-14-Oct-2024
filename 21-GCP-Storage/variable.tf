variable "project_id" {
  type        = string
  description = "The ID of the project in which to create resources."
  default     = "cognixia-1607499012052"
}

variable "region" {
  type        = string
  description = "The region for the resources."
  default     = "us-central1" # Default region
}


variable "location" {
  default = "US"
}

variable "storage-class" {
  default = "REGIONAL"
}

variable "bucket_name" {
 default = "amitvashist7-terraform-user-tf02"
}