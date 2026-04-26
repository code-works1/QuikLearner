#!/usr/bin/env bash
set -euo pipefail

kubectl apply -f common/namespaces.yaml
kubectl apply -f common/storageclass-gp3.yaml

echo
kubectl get ns jenkins jfrog
echo
kubectl get storageclass
