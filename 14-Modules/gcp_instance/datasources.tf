data "google_compute_zones" "zone" {}

data "google_compute_image" "my_image" {
  family  = "debian-12"
  project = "debian-cloud"
}