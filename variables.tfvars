# Variable file for OpenVINO Model Server deployment

# Google Cloud Platform project ID
project_id = "your_project_id"

# Compute region and zone
region = "us-central1"
zone   = "us-central1-a"

# Network and subnet settings
network_name  = "your_network_name"
subnet_name   = "your_subnet_name"
subnet_cidr   = "10.0.0.0/24"

# GKE cluster settings
cluster_name        = "your_cluster_name"
initial_node_count  = 3

# OpenVINO Model Server deployment settings
model_server_version = "2021.4"
model_name           = "your_model_name"
model_mount_path     = "/mnt/models"
replicas             = 2
cpu_limit            = "2"
memory_limit         = "2Gi"
cpu_request          = "1"
memory_request       = "1Gi"

# Persistent disk settings
pd_name     = "your_persistent_disk_name"
pd_fs_type  = "ext4"

# Kubernetes service settings
service_type   = "LoadBalancer"
service_port   = 8080
container_port = 8080

# Remote state backend settings
backend_bucket            = "your_backend_bucket_name"
backend_prefix            = "your_backend_prefix"
backend_credentials_file  = "path/to/your/credentials/file.json"
