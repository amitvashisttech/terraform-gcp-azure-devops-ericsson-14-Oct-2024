// Google Provider
provider "google" {
  credentials = file("/root/.gcp-account.json")
  project     = "cognixia-1607499012052"
  region      = "us-central1"
}

// Ubuntu Image Data Source
data "google_compute_image" "ubuntu" {
  family  = "ubuntu-2004-lts"
  project = "ubuntu-os-cloud"
}



// Compute Resource Block
resource "google_compute_instance" "vm" {
  name         = "webserver"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"


  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.st.address
    }
  }
}


// Static IP Address 
resource "google_compute_address" "st" {
  name = "ipv4-address"
}


output "public" {
  value = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip

}
