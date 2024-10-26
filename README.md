# Demo  Microservice

## Overview

The **Demo  Microservice** is designed to interact with the [Star Wars API (SWAPI)](https://swapi.dev/). The primary objective of this microservice is to demonstrate proficiency in software development, containerization, orchestration, and performance optimization. It is implemented in Python following an architectural design pattern, and it fetches, sorts, and returns data from SWAPI's people endpoint.

The solution is provided as a public GitHub repository, showcasing various aspects of software engineering, including error handling, logging, and container orchestration.

## Features

- **SWAPI Integration**: Consumes the people endpoint from SWAPI to fetch data related to Star Wars characters.
- **Data Sorting**: Fetches and sorts data in ascending order based on the `name` attribute.
- **Custom Endpoint**: Provides a RESTful endpoint that returns the sorted data.
- **Error Handling**: Implements comprehensive error handling to manage issues such as API failures and incorrect parameters.

## Architecture

The microservice follows a modular architectural design pattern, separating responsibilities into different components to ensure maintainability and scalability. It is structured as follows:

- **Controllers**: Handle incoming HTTP requests and manage routing.
- **Services**: Contain business logic and interact with SWAPI or other data sources.
- **Utilities**: Helper functions for common tasks, such as data transformations and validation.
- **Tests**: Unit tests to verify the behavior of the services and utilities.

The architecture leverages containerization for deployment, ensuring the service can be easily orchestrated using Docker or Kubernetes.

## Project Structure

The project is organized as follows:

```
DEMO-MICROSERVICE/
|
├── .github/workflows/
│   ├── build-main.yaml
│   └── build-pr.yaml
|
├── app/
│   ├── unit-tests/
│   ├── __init__.py
│   ├── controllers.py
│   ├── models.py
│   ├── services.py
│   ├── utils.py
│   └── README.MD
|
├── charts/demo-microservice/
│   ├── templates/
│   ├── .helmignore
│   ├── Chart.yaml
│   └── values.yaml
|
├── horizontalpodtest/
│   ├── load-generator.sh
│   └── README.md
|
├── run-service-kind-local/
│   ├── prerequisites
│   ├── README.md
│   └── run.sh
|
├── Dockerfile
├── main.py
├── README.md
└── requirements.txt
```

## Usage

### Endpoints

The microservice provides several RESTful endpoints for interacting with SWAPI data. Below are the key endpoints:

- `GET /`: Retrieve the status of the microservice.
- `GET /people`: Retrieve a sorted list of people from SWAPI.
- `GET /people/<int:id>`: Retrieve information about a specific person by their ID from SWAPI.

Example usage:

```bash
curl http://localhost:5000/people
```

## Setup and Installation

### Prerequisites

- Python 3.8+
- Docker
- [SWAPI](https://swapi.dev/) (for integration purposes)

### Installation Steps

1. **Clone the repository**:

   ```bash
   git clone https://github.com/TanzilaKhalfan2/demo-bmw-microservice.git
   cd demo-bmw-microservice
   ```


## Deployment

### Local Deployment Using Kind Cluster
To deploy the microservice locally, navigate to the `run-service-kind-local` folder based on the above Project Structure and follow the instructions in the `README.md` file.

### Automated Deployment Using GitHub Actions
You can also deploy the microservice using GitHub Actions workflows available in the `.github/workflows/` folder.

## Contact

For any issues or inquiries, please contact [TanzilaKhalfan2](https://github.com/TanzilaKhalfan2) on GitHub.

