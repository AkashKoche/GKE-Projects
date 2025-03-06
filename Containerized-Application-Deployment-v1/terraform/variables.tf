variable "project_id" {
  description = "GCP Project ID"
  type        = string
}


variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}


variable "cluster_name" {
  description = "Name of the GKE CLuster"
  type = string
  default = "my-gke-cluster"
}


variable "node_count" {
  description = "Number of Nodes in the GKE Cluster"
  type = number
  default = 3
}
