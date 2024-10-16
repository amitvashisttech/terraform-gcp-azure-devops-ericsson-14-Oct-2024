data "google_compute_zones" "us-central1" {}

data "google_compute_zones" "us-west1" {
     provider = google.myprovider2
}


data "google_compute_image" "my_image" {
  family  = "debian-12"
  project = "debian-cloud"
}