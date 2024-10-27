# Demo Microservice - Local Setup Guide

This guide will help you set up the **Demo Microservice** locally using Kind, Helm, and Docker.

## Prerequisites
Before running the microservice, you need to install the dependencies. The dependencies include Kind, Helm, and kubectl.

### Install Dependencies
1. Navigate to the `run-service-kind-local/prerequisites` directory.
2. Run the following script to install dependencies:

   ```sh
   cd ./run-service-kind-local/prerequisites
   chmod +x ./install_dependencies.sh
   ./install_dependencies.sh
   ```

   This script will:
   - Download and install Kind based on your system architecture (AMD64 or ARM64).
   - Download and install Helm based on your system architecture.
   - Install kubectl using snap.

### Run the Service
After installing the dependencies, proceed to run the service.

1. Navigate to the `demo-microservice` directory.
2. Run the following script to create the Kind cluster, build the Docker image, and deploy the service:

   ```sh
   chmod +x ./run.sh
   ./run.sh
   ```

   This script will:
   - Build the Docker image for the service.
   - Create a Kind cluster named **m-demo**.
   - Set the kubeconfig context to use the newly created cluster.
   - Add the Helm chart repository, update it, and list available Helm charts.
   - Upgrade or install the **demo-microservice** Helm chart.

## Script Details
### install_dependencies.sh
The `install_dependencies.sh` script installs the following tools:
- **Kind**: A tool for running local Kubernetes clusters using Docker.
- **Helm**: A package manager for Kubernetes.
- **kubectl**: A command-line tool for interacting with Kubernetes clusters.

### run.sh
The `run.sh` script performs the following actions:
- **build_docker_image**: Builds the Docker image for the microservice.
- **create_kind_cluster**: Creates a Kind Kubernetes cluster.
- **set_kubeconfig_context**: Sets the kubeconfig context to use the Kind cluster.
- **add_helm_repo**: Adds the Helm chart repository.
- **update_helm_repo**: Updates the Helm chart repository.
- **list_helm_repos**: Lists the Helm chart repositories.
- **search_helm_charts**: Searches for available Helm charts in the repository.
- **upgrade_helm_chart**: Upgrades or installs the Helm chart for the microservice.

## Additional Information
- **Cluster Name**: The default Kind cluster name is **m-demo**.
- **Helm Chart Repository**: The default Helm chart repository name is **mCharts**.
- **Docker Image**: The Docker image built by the script is named **demo-microservice:latest**.

Ensure Docker is running on your system before executing these scripts, as it is required for both building the Docker image and running the Kind cluster.

