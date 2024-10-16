
resource "google_compute_instance" "frontend" {
  depends_on = [google_compute_instance.backend]
  #name         = join("-", tolist([var.environment-name, "frontend-west"]))
  name         = local.default_frontend_name
  count        = var.multi-region-deployment ? 1 : 0
  zone         = var.us-west-zones[count.index]
  machine_type = var.instance_type
  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}


resource "google_compute_instance" "backend" {
  machine_type = var.instance_type
  #name         = join("-", tolist([var.environment-name, "backend-west"]))
  name  = local.default_backend_name
  count = var.multi-region-deployment ? 2 : 0
  zone  = var.us-west-zones[count.index]
  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
  lifecycle {
    prevent_destroy = false
  }
}

