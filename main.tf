# Declare the provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Create a VPC network
resource "google_compute_network" "vpc_network" {
  name                    = var.network_name
  auto_create_subnetworks = false
}

# Create a subnet in the VPC network
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  network       = google_compute_network.vpc_network.self_link
  region        = var.region
}

# Create a GKE cluster with the subnet and VPC network
resource "google_container_cluster" "gke_cluster" {
  name               = var.cluster_name
  location           = var.zone
  network            = google_compute_network.vpc_network.self_link
  subnetwork         = google_compute_subnetwork.subnet.self_link
  initial_node_count = var.initial_node_count

  # Add any additional configuration here, such as node pool configuration
}

# Deploy the OpenVINO Model Server on the GKE cluster
resource "kubernetes_deployment" "openvino_server" {
  metadata {
    name = "openvino-server"
    labels = {
      app = "openvino-server"
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "openvino-server"
      }
    }

    template {
      metadata {
        labels = {
          app = "openvino-server"
        }
      }

      spec {
        container {
          name  = "openvino-server"
          image = "openvino/model_server:${var.model_server_version}"

          # Configure environment variables
          env {
            name  = "MODEL_NAME"
            value = var.model_name
          }

          # Mount a volume to the container
          volume_mount {
            name       = "model"
            mount_path = var.model_mount_path
          }

          # Define resource limits and requests
          resources {
            limits {
              cpu    = var.cpu_limit
              memory = var.memory_limit
            }
            requests {
              cpu    = var.cpu_request
              memory = var.memory_request
            }
          }
        }

        # Define a volume to store the model files
        volume {
          name = "model"
          gce_persistent_disk {
            pd_name = var.pd_name
            fs_type = var.pd_fs_type
            read_only = true
          }
        }
      }
    }
  }
}

# Expose the OpenVINO Model Server with a service
resource "kubernetes_service" "openvino_service" {
  metadata {
    name = "openvino-service"
  }

  spec {
    selector = {
      app = "openvino-server"
    }

    # Choose a service type
    type = var.service_type

    # Specify the ports to expose
    port {
      port        = var.service_port
      target_port = var.container_port
    }

    # Add any additional configuration here, such as load balancer settings
  }
}

# Define the remote state backend configuration
terraform {
  backend "gcs" {
    bucket  = var.backend_bucket
    prefix  = var.backend_prefix
    credentials = var.backend_credentials_file
  }
}
