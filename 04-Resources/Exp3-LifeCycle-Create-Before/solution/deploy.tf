// Provider Block
provider "google" {
  credentials = file("/root/.gcp-account.json")
  project     = "cognixia-1607499012052"
  region      = "us-central1"
}


resource "google_compute_instance" "backend" {
  name         = "backend-01"
  machine_type = "e2-micro"
  zone         = "us-central1-a"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      #image = "centos-cloud/centos-stream-9"

    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  lifecycle {
    create_before_destroy = true
  }

}