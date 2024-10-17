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

  metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y && echo '<!doctype html><html><body><h1>Hello from Terraform on Google Cloud!</h1></body></html>' | sudo tee /var/www/html/index.html"

  tags = ["http-server"]

  network_interface {
    network = var.myvpc_name
    subnetwork = "subnet-02"
    access_config {
    }
  }
}


resource "google_compute_firewall" "fw" {
  name    = "apache2-firewall-rules"
  network = var.myvpc_name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["http-server", "https-server"]
}

output "public" {
  value = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip

}
