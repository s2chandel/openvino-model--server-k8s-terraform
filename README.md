
# Deploying OpenVINO Model Server on Google Kubernetes Engine (GKE) using Terraform
This project provides Terraform code to deploy OpenVINO Model Server on GKE. The code creates a VPC network, a subnet, a GKE cluster, a Kubernetes deployment for the OpenVINO Model Server, and a Kubernetes service to expose the server. The server runs on a Google Compute Engine persistent disk, which is mounted as a volume in the container.

Terraform, follow these steps:

Install Terraform: Download and install Terraform from the official website.

Create a Google Cloud Platform (GCP) project: Create a new GCP project or use an existing one. Enable the Compute Engine and Kubernetes Engine APIs in the project.

Create a service account: Create a service account with the required permissions to manage GCP resources. Download the service account key file in JSON format.

Set up variables: Update the  variables.tfvars and set the values for the following variables:

* project_id: The ID of your GCP project.
* region: The region where you want to create the GKE cluster.
* zone: The zone where you want to create the GKE cluster.
* network_name: The name of the VPC network.
* subnet_name: The name of the subnet within the VPC network.
* subnet_cidr: The CIDR range for the subnet.
* cluster_name: The name of the GKE cluster.
* initial_node_count: The number of nodes to create in the GKE cluster.
* model_server_version: The version of the OpenVINO Model Server to deploy.
* model_name: The name of the OpenVINO model to deploy.
* model_mount_path: The path where the model will be mounted in the container.
* cpu_limit: The CPU limit for the container.
* memory_limit: The memory limit for the container.
* cpu_request: The CPU request for the container.
* memory_request: The memory request for the container.
* pd_name: The name of the persistent disk to use for storing the model files.
* pd_fs_type: The file system type of the persistent disk.
* service_type: The type of service to expose the OpenVINO Model Server.
* service_port: The port to expose the OpenVINO Model Server.
* container_port: The port on which the OpenVINO Model Server is listening.

## Run Terraform: Run the following commands in the terminal:


```
terraform init
terraform plan -var-file=variables.tfvars
terraform apply -var-file=variables.tfvars
```
The terraform init command initializes the Terraform working directory. The terraform plan command creates an execution plan, which shows what actions Terraform will take to create the resources. The terraform apply command applies the changes and creates the resources.

Access the OpenVINO Model Server: After the deployment is complete, access the OpenVINO Model Server by running the following command:
```
kubectl get service openvino-service
```
The output will show the IP address and port of the OpenVINO Model Server. You can access the server by using the IP address and port in a web browser or a client application.
