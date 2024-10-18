output "cluster_name" {
  description = "The name of the GKE cluster."
  value       = google_container_cluster.primary.name
}

output "kubernetes_ca_certificate" {
  description = "The base64 encoded public certificate for the cluster."
  value       = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
}

output "node_pool_name" {
  description = "The name of the GKE node pool."
  value       = google_container_node_pool.primary_nodes.name
}