#!/bin/bash

# Set the Kubernetes namespace and service details
NAMESPACE="default"
SERVICE_NAME="demo-microservice"
SERVICE_PORT="80"

# Get the ClusterIP address of the service
SERVICE_IP=$(kubectl get svc $SERVICE_NAME -n $NAMESPACE -o jsonpath='{.spec.clusterIP}')

if [ -z "$SERVICE_IP" ]; then
  echo "Error: Could not determine ClusterIP address of the service."
  exit 1
fi

# Create a busybox pod to generate continuous HTTP calls to the service
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: busybox-load-generator
  namespace: $NAMESPACE
spec:
  containers:
  - name: busybox
    image: busybox
    command: ["sh", "-c", "while true; do wget -qO- http://$SERVICE_IP:$SERVICE_PORT; sleep 0.0001; done"]
  restartPolicy: Never
EOF

# Wait until the busybox pod is running
kubectl wait --for=condition=ready pod/busybox-load-generator -n $NAMESPACE --timeout=60s

# Print a message to indicate the load generation is running
echo "Load generation started. Monitor your horizontal pod autoscaler to observe scaling behavior."
