output "backend_ips" {
  value = tolist(["${google_compute_instance.backend.*.network_interface.0.access_config.0.nat_ip}", "${google_compute_instance.backend.*.network_interface.0.network_ip}"])
}


output "zones_west1" {
  value = data.google_compute_zones.us-west1.names
}

output "zones_central1" {
  value = data.google_compute_zones.us-central1.names
}

output "my_image" {
  value = data.google_compute_image.my_image
}