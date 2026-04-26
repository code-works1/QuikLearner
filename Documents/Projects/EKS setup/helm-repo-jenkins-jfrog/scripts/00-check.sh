#!/usr/bin/env bash
set -euo pipefail

echo "Checking tools..."
command -v aws >/dev/null || { echo "aws CLI not found"; exit 1; }
command -v kubectl >/dev/null || { echo "kubectl not found"; exit 1; }
command -v helm >/dev/null || { echo "helm not found"; exit 1; }

echo
echo "AWS account:"
aws sts get-caller-identity || true

echo
echo "Kubernetes context:"
kubectl config current-context

echo
echo "Nodes:"
kubectl get nodes

echo
echo "Storage classes:"
kubectl get storageclass || true

echo
echo "EBS CSI driver:"
kubectl get pods -n kube-system | grep ebs || echo "EBS CSI pods not found. Install EBS CSI driver if gp3 provisioning fails."
