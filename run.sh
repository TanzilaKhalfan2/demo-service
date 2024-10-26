#!/bin/bash

# Variables
CLUSTER_NAME="bmw-demo"
HELM_REPO_NAME="bmwCharts"
HELM_REPO_URL="https://tanzilakhalfan2.github.io/demo-bmw-microservice/"
HELM_CHART_NAME="demo-bmw-microservice"
HELM_CHART_VERSION=""
DOCKER_IMAGE_NAME="demo-bmw-microservice:latest"

# Function to build Docker image
build_docker_image() {
  echo "Building Docker image '$DOCKER_IMAGE_NAME'..."
  docker build -t "$DOCKER_IMAGE_NAME" . || { echo "Failed to build Docker image"; exit 1; }
}

# Function to create Kind cluster
create_kind_cluster() {
  if kind get clusters | grep -q "$CLUSTER_NAME"; then
    echo "Kind cluster '$CLUSTER_NAME' already exists."
  else
    echo "Creating Kind cluster '$CLUSTER_NAME'..."
    kind create cluster --name "$CLUSTER_NAME" || { echo "Failed to create Kind cluster"; exit 1; }
  fi
}

# Function to set kubeconfig context
set_kubeconfig_context() {
  echo "Setting kubeconfig context to 'kind-$CLUSTER_NAME'..."
  kubectl cluster-info --context "kind-$CLUSTER_NAME" || { echo "Failed to set kubeconfig context"; exit 1; }
}

# Function to add Helm chart repository
add_helm_repo() {
  if helm repo list | grep -q "$HELM_REPO_NAME"; then
    echo "Helm repo '$HELM_REPO_NAME' already exists."
  else
    echo "Adding Helm repo '$HELM_REPO_NAME'..."
    helm repo add "$HELM_REPO_NAME" "$HELM_REPO_URL" || { echo "Failed to add Helm repo"; exit 1; }
  fi
}

# Function to update Helm chart repository
update_helm_repo() {
  echo "Updating Helm repo '$HELM_REPO_NAME'..."
  helm repo update || { echo "Failed to update Helm repo"; exit 1; }
}

# Function to list Helm chart repositories
list_helm_repos() {
  echo "Listing Helm repos..."
  helm repo list || { echo "Failed to list Helm repos"; exit 1; }
}

# Function to search for Helm charts
search_helm_charts() {
  echo "Searching for Helm charts in repo '$HELM_REPO_NAME'..."
  helm search repo "$HELM_REPO_NAME" || { echo "Failed to search Helm charts"; exit 1; }
}

# Function to upgrade or install Helm chart
upgrade_helm_chart() {
  echo "Upgrading or installing Helm chart '$HELM_CHART_NAME'..."
  if [ -z "$HELM_CHART_VERSION" ]; then
    echo "Upgrading or installing Helm chart '$HELM_CHART_NAME' from local directory..."
    # Load the Docker image into the Kind cluster
    kind load docker-image $DOCKER_IMAGE_NAME --name $CLUSTER_NAME
    # Install the Helm chart from the local directory
    helm upgrade --install "$HELM_CHART_NAME" "./charts/$HELM_CHART_NAME" -f "./charts/$HELM_CHART_NAME/values.yaml" || { echo "Failed to upgrade/install Helm chart"; exit 1; }
  else
    echo "Upgrading or installing Helm chart '$HELM_CHART_NAME' from repo '$HELM_REPO_NAME'..."
    helm upgrade --install "$HELM_CHART_NAME" "$HELM_REPO_NAME/$HELM_CHART_NAME" --version "$HELM_CHART_VERSION" || { echo "Failed to upgrade/install Helm chart"; exit 1; }
  fi
}

# Main script execution
build_docker_image
create_kind_cluster
set_kubeconfig_context
add_helm_repo
update_helm_repo
list_helm_repos
search_helm_charts
upgrade_helm_chart