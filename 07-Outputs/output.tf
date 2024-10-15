output "instance_ip" {
  value       = google_compute_instance.frontend.*.network_interface.0.network_ip
  description = "Display IP"
}

output "instance_public_ip" {
  value       = google_compute_instance.frontend.*.network_interface.0.access_config.0.nat_ip
  description = "Display IP"
}