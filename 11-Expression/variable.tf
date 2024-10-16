variable "us-west-zones" {
  default = ["us-west1-a", "us-west1-b"]
}

variable "us-central-zones" {
  default = ["us-central1-a", "us-central1-b"]
}

variable "multi-region-deployment" {
  default = true
}

variable "environment-name" {
  default = "tfdemo"
}

variable "boot_disk_image" {
  type        = string
  default     = "debian-cloud/debian-12"
  description = "Varible for Instance Boot Image"
}

variable "instance_type" {
  type        = string
  default     = "e2-micro"
  description = "Varible for Instance Type"
}