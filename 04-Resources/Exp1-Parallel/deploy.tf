// Provider Block
provider "google" {
  credentials = file("/root/.gcp-account.json")
  project     = "cognixia-1607499012052"
  region      = "us-central1"
}


resource "google_compute_instance" "frontend" {
  name         = "t-ci-01"
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

resource "google_compute_instance" "backend" {
  name         = "t-ci-01"
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