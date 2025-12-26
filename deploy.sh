#!/bin/bash
echo "🚀 Starting Local CI/CD Pipeline..."

# CI: Validation Step
echo "🔍 Validating YAML files..."
kubectl apply --dry-run=client -f configmap.yaml -f deploy.yaml
if [ $? -ne 0 ]; then
echo "❌ Validation failed! Fix your YAML."
exit 1
fi

# CD: Deployment Step
echo "📦 Deploying to Kubernetes..."
kubectl apply -f configmap.yaml
kubectl apply -f deploy.yaml

echo "✅ Deployment Successful!"
