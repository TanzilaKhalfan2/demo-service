# BMW Microservice

This project is a microservice for BMW, built using Flask and deployed using Helm on Kubernetes.

## Project Structure

## Getting Started

### Prerequisites

- Python 3.9
- Docker
- Kubernetes
- Helm

### Installation

1. **Clone the repository:**

    ```sh
    git clone <repository-url>
    cd demo-bmw-microservice
    ```

2. **Install Python dependencies:**

    ```sh
    pip install -r requirements.txt
    ```

3. **Build Docker image:**

    ```sh
    docker build -t bmw-microservice .
    ```

4. **Setup Kubernetes cluster using Kind:**

    ```sh
    ./setup-kind/install_kind.sh
    ```

5. **Load the Docker Image into kind:**

    ```sh
    kind load docker-image bmw-microservice:latest --name kind-bmw-demo
    ```

6. **Deploy using Helm:**

    ```sh
    helm install demo-bmw-svc ./demo-bmw-svc
    ```

7. **PORT Forward to get the application URL by running these commands:**
    
    ```sh
    export SERVICE_PORT=$(kubectl get svc demo-bmw-svc --namespace default -o jsonpath="{.spec.ports[0].port}")
    kubectl --namespace default port-forward service/demo-bmw-svc 5000:$SERVICE_PORT
    ```