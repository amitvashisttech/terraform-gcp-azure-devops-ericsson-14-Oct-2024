
resource "google_compute_instance" "frontend" {
  name         = "frontend"
  machine_type = "e2-micro"
  zone         = "us-central1-a"


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




