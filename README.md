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
    export SERVICE_PORT=$(kubectl get svc demo-bmw-microservice --namespace default -o jsonpath="{.spec.ports[0].port}")
    kubectl --namespace default port-forward service/demo-bmw-microservice 8080:$SERVICE_PORT
    ```

### Deploy  helm chart locally
    
1. **Add Helm chart repo locally:**

    ```sh
    helm repo add bmwCharts https://tanzilakhalfan2.github.io/demo-bmw-microservice/
    
    helm repo update
    ```

2. **List Helm Chart repo:**

    ```sh
    helm repo list
    ```

3. **To list all charts available Helm repository, you can use the following command:**

    ```sh
    helm search repo bmwCharts
    ```

4. **If you want more details about this chart, you can use:**

    ```sh
    helm show chart bmwCharts/demo-bmw-microservice
    ```

5. **To upgrade (or install, if not already installed) your Helm chart, you can use the following command:**

    ```sh
    helm upgrade --install demo-bmw-microservice bmwCharts/demo-bmw-microservice --values <values-file>
    ```
    or
    ```sh
    helm upgrade --install demo-bmw-microservice bmwCharts/demo-bmw-microservice 
    ```


