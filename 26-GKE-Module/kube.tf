module "gke_cluster" {
  source           = "./kubernetes"
  project_id       = "cognixia-1607499012052"
  region           = "us-central1-a"
  additional_zones = ["us-central1-b"]
  cluster_name     = "mygke-cluster"
  node_count       = 1
  max_node_count   = 2
  machine_type     = "e2-micro"
  environment      = "uat"
  preemptible      = false
}
