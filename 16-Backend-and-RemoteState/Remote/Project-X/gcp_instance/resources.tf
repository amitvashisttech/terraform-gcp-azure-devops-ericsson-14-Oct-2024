
resource "google_compute_instance" "vm" {
  name         = local.default_instance_name
  count        = var.instance_count
  zone         = data.google_compute_zones.zone.names[count.index]
  machine_type = var.instance_type
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
}
