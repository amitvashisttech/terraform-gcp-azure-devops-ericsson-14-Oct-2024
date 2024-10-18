variable "project_id" {
  description = "The project ID where the GKE cluster will be created."
  type        = string
}

variable "region" {
  description = "The region where the GKE cluster and node pool will be deployed."
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
  default     = "gke-cluster"
}

variable "node_count" {
  description = "The number of nodes to create in the node pool."
  type        = number
  default     = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes for the autoscaler."
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "The machine type to use for the GKE node instances."
  type        = string
  default     = "e2-medium"
}

variable "preemptible" {
  description = "Whether the nodes in the node pool should be preemptible."
  type        = bool
  default     = false
}

variable "environment" {
  description = "A label to define the environment for the GKE nodes."
  type        = string
  default     = "dev"
}



variable "additional_zones" {
  description = "Additional zones where GKE nodes will be deployed (should not include the primary zone)."
  type        = list(string)
  default     = ["us-central1-b", "us-central1-c"]  # Adjust this as needed.
}
