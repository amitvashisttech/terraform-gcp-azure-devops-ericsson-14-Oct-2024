variable "instance_count" {
  default = "1"
}

variable "environment-name" {
  default = "tfdemo"
}

variable "instance_type" {
  type        = string
  default     = "e2-micro"
  description = "Varible for Instance Type"
}
