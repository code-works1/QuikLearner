#!/usr/bin/env bash
set -euo pipefail

helm repo add jenkins https://charts.jenkins.io || true
helm repo update

helm upgrade --install jenkins jenkins/jenkins \
  -n jenkins \
  -f values/jenkins-values.yaml

echo
echo "Jenkins resources:"
kubectl get pods,pvc,svc -n jenkins
