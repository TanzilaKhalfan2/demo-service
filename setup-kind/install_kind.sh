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
