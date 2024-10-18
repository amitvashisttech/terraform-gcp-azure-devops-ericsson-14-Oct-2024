variable "zones" {
  type        = list(any)
  default     = ["us-central1-a", "us-central1-b"]
  description = "Zone Valiable for Instance Placement"
}

variable "instance_count" {
  type        = number
  default     = 2
  description = "Varible for Instance Count"
}

variable "instance_type" {
  type        = string
  default     = "e2-micro"
  description = "Varible for Instance Type"
}

variable "instance_name" {
  type        = string
  default     = "azure-gcp-cicd-vm"
  description = "Varible for Instance Name"
}

variable "boot_disk_image" {
  type        = string
  default     = "debian-cloud/debian-12"
  description = "Varible for Instance Boot Image"
}