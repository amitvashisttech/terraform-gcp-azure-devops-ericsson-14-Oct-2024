output "ips" {
  value = google_compute_instance.vm.*.network_interface.0.access_config.0.nat_ip
}


output "zones_west1" {
   value = data.google_compute_zones.zone.names
}

output "my_image"  {
   value = data.google_compute_image.my_image
}