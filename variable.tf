# Variables for the Google Cloud project and region
variable "project_id" {
  description = "Google Cloud project ID"
}

variable "region" {
  description = "Google Cloud region"
}

# Variables for the VPC network and subnet
variable "network_name" {
  description = "Name of the VPC network to create"
}

variable "subnet_name" {
  description = "Name of the subnet to create"
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
}

# Variables for the GKE cluster
variable "cluster_name" {
  description = "Name of the GKE cluster to create"
}

variable "zone" {
  description = "Google Cloud zone"
}

variable "initial_node_count" {
  description = "Initial number of nodes in the GKE cluster"
}

# Variables for the OpenVINO Model Server deployment
variable "model_server_version" {
  description = "Version of the OpenVINO Model Server Docker image to deploy"
}

variable "model_name" {
  description = "Name of the OpenVINO model to deploy"
}

variable "model_mount_path" {
  description = "Mount path for the OpenVINO model in the container"
}

variable "cpu_limit" {
  description = "CPU limit for the OpenVINO server container"
}

variable "memory_limit" {
  description = "Memory limit for the OpenVINO server container"
}

variable "cpu_request" {
  description = "CPU request for the OpenVINO server container"
}

variable "memory_request" {
  description = "Memory request for the OpenVINO server container"
}

variable "replicas" {
  description = "Number of replicas for the OpenVINO server deployment"
}

variable "pd_name" {
  description = "Name of the Google Cloud persistent disk to use for the OpenVINO model files"
  default = "my-pd"
}

variable "pd_fs_type" {
  description = "Filesystem type of the Google Cloud persistent disk"
}

# Variables for the Kubernetes service
variable "service_type" {
  description = "Type of Kubernetes service to create (e.g. LoadBalancer)"
}

variable "service_port" {
  description = "Port number to use for the Kubernetes service"
}

variable "container_port" {
  description = "Port number on the OpenVINO server container to expose"
}

# Variables for the remote state backend
variable "backend_bucket" {
  description = "Name of the Google Cloud Storage bucket to use for remote state storage"
}

variable "backend_prefix" {
  description = "Prefix to use for remote state storage in the Google Cloud Storage bucket"
}

variable "backend_credentials_file" {
  description = "Path to the Google Cloud service account credentials file for remote state storage"
}
