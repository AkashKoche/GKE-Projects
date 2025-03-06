provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "gke_cluster" {
  name                     = var.cluster_name
  location                 = var.region
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.region
  cluster    = google_container_cluster.gke_cluster.name
  node_count = var.node_count

  node_config {
   machine_type = "e2-medium"
   oauth_scopes = [
    "https://www.googleapis.com/auth/cloud-platform"
   ]
 }
}

resource "google_artifact_registry_repository" "my-repo" {
  provider      = google
  location      = var.region
  repository_id = "my-repo"
  format        = "DOCKER"
}

resource "kubernetes_deployment" "my-app" {
  metadata {
    name = "my-app"
    labels = {
     app = "my-app"
    }
   }
  spec {
    replicas = 3

    selector {
     match_labels = {
      app = "my-app"
     }
    }

    template {
     metadata {
      labels = {
        app = "my-app"
      }
     }

     spec {
       container {
         image = "us-central1-docker.pkg.dev/${var.project_id}/my-repo/my-app:latest"
         name = "my-app"
         port {
           container_port = 8080
         }
        }
       }
      }
     }
    }

resource "kubernetes_service" "my_app_service" {
  metadata {
    name = "my-app=service"
  }
  spec {
   selector = {
     app = "my-app"
    }
    port {
       port        = 80
       target_port = 8080
      }
      type = "LoadBalancer"
     }
    }
