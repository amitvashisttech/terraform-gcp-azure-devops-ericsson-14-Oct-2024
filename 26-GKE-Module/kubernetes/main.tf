# Setup GKE Cluster
resource "google_container_cluster" "primary" {
    name = var.cluster_name 
    location = var.region

    initial_node_count = 1

    remove_default_node_pool = true 
    node_locations           = var.additional_zones 

    ip_allocation_policy {}

    deletion_protection  =  falsels
    
}


# Setup GKE Node Pool 
resource "google_container_node_pool" "primary_nodes" {
    cluster = google_container_cluster.primary.name
    location = var.region
    name     = "primary-node-pool"
    node_count = var.node_count

    node_config { 
        machine_type = var.machine_type

       oauth_scopes = [
           "https://www.googleapis.com/auth/cloud-platform",
       ]

       labels = { 
        environment = var.environment
       }

      metadata = {
        disable-legacy-endpoints = "true"
      }

      tags = ["gke-node"]

      preemptible = var.preemptible
    }

    autoscaling { 
        min_node_count = 1 
        max_node_count = var.max_node_count
    }

    management { 
        auto_repair = true 
        auto_upgrade = true 
    }

}

