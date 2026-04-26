#!/usr/bin/env bash
set -euo pipefail

kubectl apply -f ingress/

echo
kubectl get ingress -A
