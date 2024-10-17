variable "zones" {
  type        = list(any)
  default     = ["us-central1-a", "us-central1-b"]
  description = "Zone Valiable for Instance Placement"
}






resource "google_compute_instance" "frontend" {
  count        = 2
  name         = "frontend-${count.index}"
  machine_type = "e2-micro"
  #zone         = "us-central1-a"
  zone = var.zones[count.index]


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

