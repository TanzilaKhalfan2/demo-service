#!/bin/bash

# Create kind cluster
kind create cluster --name bmw-demo
# Set the kubeconfig context
kubectl cluster-info --context kind-bmw-demo
# Load the Docker image into the Kind cluster
kind load docker-image bmw-microservice:latest --name bmw-demo
# Add the Helm chart repository
helm repo add bmwCharts https://tanzilakhalfan2.github.io/demo-bmw-microservice/
# Update the Helm chart repository
helm repo update
# List the Helm chart repositories
helm repo list
# Search for the Helm chart
helm search repo bmwCharts
# Show the Helm chart
helm show chart bmwCharts/demo-bmw-microservice
# Install Helm chart to Kind cluster
helm upgrade --install demo-bmw-microservice bmwCharts/demo-bmw-microservice 
# or
# helm upgrade demo-bmw-microservice ./charts/demo-bmw-microservice --install