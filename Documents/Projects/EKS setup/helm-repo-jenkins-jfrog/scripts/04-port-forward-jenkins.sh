#!/usr/bin/env bash
set -euo pipefail

echo "Port forwarding Jenkins..."
echo "Open: http://localhost:8080"
kubectl port-forward svc/jenkins 8080:8080 -n jenkins
