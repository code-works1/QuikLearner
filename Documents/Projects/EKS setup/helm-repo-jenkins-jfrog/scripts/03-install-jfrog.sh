#!/usr/bin/env bash
set -euo pipefail

helm repo add jfrog https://charts.jfrog.io || true
helm repo update

helm upgrade --install artifactory jfrog/artifactory \
  -n jfrog \
  -f values/jfrog-values.yaml

echo
echo "JFrog resources:"
kubectl get pods,pvc,svc -n jfrog
