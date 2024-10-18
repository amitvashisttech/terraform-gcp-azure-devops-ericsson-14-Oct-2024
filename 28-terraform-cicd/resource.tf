resource "google_compute_instance" "frontend" {
  count        = var.instance_count
  name         = "${var.instance_name}-${count.index}"
  machine_type = var.instance_type
  zone         = var.zones[count.index]


  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

