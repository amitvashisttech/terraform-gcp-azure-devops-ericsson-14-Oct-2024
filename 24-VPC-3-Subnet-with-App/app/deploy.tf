// Ubuntu Image Data Source
data "google_compute_image" "ubuntu" {
  family  = "ubuntu-2004-lts"
  project = "ubuntu-os-cloud"
}

resource "random_id" "vm_id" {
    byte_length = 2 
}


// Compute Resource Block
resource "google_compute_instance" "vm" {
  name         = "vm-${random_id.vm_id.hex}"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"


  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }

  metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y && echo '<!doctype html><html><body><h1>Welcome to the world of Cloud Automation with Terraform on Google Cloud!</h1></body></html>' | sudo tee /var/www/html/index.html"

  tags = ["http-server"]

  network_interface {
    network = var.myvpc_name
    subnetwork = "subnet-02"
    access_config {
    }
  }
}


resource "google_compute_firewall" "fw" {
  name    = "firewall-rules-${random_id.vm_id.hex}"
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
