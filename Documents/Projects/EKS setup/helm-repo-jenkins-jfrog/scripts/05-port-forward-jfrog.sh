#!/usr/bin/env bash
set -euo pipefail

echo "JFrog services:"
kubectl get svc -n artifactory

echo
echo "Port forwarding JFrog..."
echo "Open: http://localhost:8082"
kubectl port-forward svc/artifactory-artifactory-nginx 8082:80 -n artifactory
