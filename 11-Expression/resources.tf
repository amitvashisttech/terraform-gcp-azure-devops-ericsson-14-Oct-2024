
resource "google_compute_instance" "west_frontend" {
  depends_on   = [ google_compute_instance.west_backend ]
  name         = join("-", tolist([var.environment-name, "frontend-west"]))
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

resource "google_compute_instance" "frontend" {
  provider     = google.myprovider2
  name         = join("-", tolist([var.environment-name, "frontend"]))
  depends_on   = [ google_compute_instance.backend ]
  count        = 1
  zone         = var.us-central-zones[count.index]
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
  provider     = google.myprovider2
  name         = join("-", tolist([var.environment-name, "backend"]))
  machine_type = var.instance_type
  count        = 1
  zone         = var.us-central-zones[count.index]
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


resource "google_compute_instance" "west_backend" {
  machine_type = var.instance_type
  name         = join("-", tolist([var.environment-name, "backend-west"]))
  count        = var.multi-region-deployment ? 2 : 0
  zone         = var.us-west-zones[count.index]
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

