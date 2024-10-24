#!/bin/bash

# Create kind cluster
kind create cluster --name bmw-demo
# Set the kubeconfig context
kubectl cluster-info --context kind-bmw-demo
# Load the Docker image into the Kind cluster
kind load docker-image bmw-microservice:latest --name bmw-demo
# Install Helm chart to Kind cluster
helm upgrade demo-bmw-microservice ./charts/demo-bmw-microservice --install