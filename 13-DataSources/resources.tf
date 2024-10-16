
resource "google_compute_instance" "west_frontend" {
  depends_on   = [ google_compute_instance.west_backend ]
  #name         = join("-", tolist([var.environment-name, "frontend-west"]))
  name         = local.west_frontend_name
  count        = var.multi-region-deployment ? 1 : 0
  #zone         = var.us-west-zones[count.index]
  zone         = data.google_compute_zones.us-west1.names[count.index]
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
  #name         = join("-", tolist([var.environment-name, "frontend"]))
  name  = local.default_frontend_name
  depends_on   = [ google_compute_instance.backend ]
  count        = 1
  #zone         = var.us-central-zones[count.index]
  zone     		= data.google_compute_zones.us-central1.names[count.index]
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
  #name         = join("-", tolist([var.environment-name, "backend"]))
  name  = local.default_backend_name
  machine_type = var.instance_type
  count        = 1
  #zone         = var.us-central-zones[count.index]
  zone         = data.google_compute_zones.us-central1.names[count.index]
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
  #name         = join("-", tolist([var.environment-name, "backend-west"]))
  name         = local.west_backend_name
  count        = var.multi-region-deployment ? 2 : 0
  #zone         = var.us-west-zones[count.index]
  zone         = data.google_compute_zones.us-west1.names[count.index]
  boot_disk {
    initialize_params {
      image = data.google_compute_image.my_image.self_link
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

