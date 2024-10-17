resource "google_service_account" "service_account" {
  display_name = "Test TF Service Account"
  account_id   = "test-svc-acctf01"
}

resource "google_service_account" "compute_admin_sa" {
  account_id   = "compute-admin-sa"
  display_name = "Compute Admin Service Account"
}

resource "google_project_iam_binding" "compute_admin_binding" {
  project = var.project_id
  role    = "roles/compute.admin"

  members = [
    "serviceAccount:${google_service_account.compute_admin_sa.email}"
  ]
}
