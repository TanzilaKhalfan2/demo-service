# This script installs the necessary dependencies for running a local Kubernetes cluster using Kind and Helm.
# It performs the following steps:
# 1. Downloads the appropriate Kind binary based on the system architecture (AMD64/x86_64 or ARM64).
# 2. Makes the Kind binary executable and moves it to /usr/local/bin for global access.
# 3. Downloads the appropriate Helm binary based on the system architecture (AMD64/x86_64 or ARM64).
# 4. Extracts the Helm binary and moves it to /usr/local/bin for global access.
# 5. Cleans up temporary files created during the installation process.
# 6. Installs kubectl using snap.

#!/bin/bash

# Download Kind for AMD64 / x86_64
if [ $(uname -m) = "x86_64" ]; then
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-$(uname)-amd64
fi

# Download Kind for ARM64
if [ $(uname -m) = "aarch64" ]; then
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.24.0/kind-$(uname)-arm64
fi

# Make the Kind binary executable
chmod +x ./kind

# Move Kind to /usr/local/bin for global access
sudo mv ./kind /usr/local/bin/kind

# Download Helm for AMD64 / x86_64
if [ $(uname -m) = "x86_64" ]; then
  curl -Lo ./helm.tar.gz https://get.helm.sh/helm-v3.13.0-linux-amd64.tar.gz
fi

# Download Helm for ARM64
if [ $(uname -m) = "aarch64" ]; then
  curl -Lo ./helm.tar.gz https://get.helm.sh/helm-v3.13.0-linux-arm64.tar.gz
fi

# Extract Helm and move to /usr/local/bin
mkdir -p helm_install && tar -zxvf ./helm.tar.gz -C helm_install
sudo mv helm_install/linux-amd64/helm /usr/local/bin/helm

# Clean up
rm -rf ./helm.tar.gz helm_install

# Install kubectl
sudo snap install kubectl --classic
