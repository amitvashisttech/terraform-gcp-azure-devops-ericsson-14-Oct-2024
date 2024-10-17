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

// Variables 
variable "public_key" {
  default     = "~/.ssh/id_rsa.pub"
  description = "My SSH Public Key Location"
}

variable "private_key" {
  default     = "~/.ssh/id_rsa"
  description = "My SSH Public Key Location"
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

  // SSH Public Key Injection
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key)}"
  }

  // SSH Connection Configuration 
  connection {
    host        = google_compute_instance.vm.network_interface.0.access_config.0.nat_ip
    user        = "ubuntu"
    type        = "ssh"
    private_key = file(var.private_key)
  }

  // Provisioner - File
  provisioner "file" {
    source      = "./frontend"
    destination = "frontend"
  }


  // Provisioner - Remote Exec
  provisioner "remote-exec" {
    inline = [
      "chmod +x ~/frontend/run.sh",
      "cd ~/frontend/",
      "sudo sh run.sh"
    ]
  }



  tags = ["http-server", "https-server"]

  network_interface {
    network = "default"
    access_config {
    }
  }
}


resource "google_compute_firewall" "fw" {
  name    = "apache2-firewall-rules"
  network = "default"

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
