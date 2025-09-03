# bedrock-pra-client-demo

This repository provides everything you need to run the [Amazon Bedrock Product Review Agent sample client app](https://github.com/aws-samples/amazon-bedrock-samples/blob/main/agents-and-function-calling/bedrock-agents/use-case-examples/product-review-agent/main.py) in a container or on Kubernetes.

## Features
- **Dockerfile** for building a container image to run the client app.
- **Helm chart** for deploying the client app to Kubernetes, with all configuration in `values.yaml`.

## Usage

### Build and Run with Docker
1. Build the image:
   ```sh
   docker build -t bedrock-pra-client-demo .
   ```
2. Run the container (pass your agent ID and alias):
   ```sh
   docker run -e AGENT_ID=your-agent-id -e AGENT_ALIAS=your-agent-alias -e AWS_DEFAULT_REGION=your-aws-region -e AWS_ACCESS_KEY_ID=your-aws-access-key-id -e AWS_SECRET_ACCESS_KEY=your-aws-secret-key -p 8501:8501 bedrock-pra-client-demo
   ```
   The app will be available at [http://localhost:8501](http://localhost:8501).

### Deploy to Kubernetes with Helm
1. Customize `helm-chart/values.yaml` as needed (image, environment variables, etc).
2. Install the chart:
   ```sh
   helm install bedrock-pra ./helm-chart
   ```
3. Optionally, set service type to `LoadBalancer` in `values.yaml` to expose externally.

## Directory Structure
- `product-review-agent/` — The client app code and requirements.
- `Dockerfile` — Multi-stage build for the client app image.
- `helm-chart/` — Helm chart for Kubernetes deployment.
- `scripts/` — Utility scripts (e.g., `run.sh`).

## References
- [Amazon Bedrock Product Review Agent Sample](https://github.com/aws-samples/amazon-bedrock-samples/tree/main/agents-and-function-calling/bedrock-agents/use-case-examples/product-review-agent)

---
Maintained by Riptides Labs.
