# Jenkins + JFrog Installation Through Helm Repos

This repo does NOT package Jenkins or JFrog charts locally.

It uses official Helm repos:

```bash
helm repo add jenkins https://charts.jenkins.io
helm repo add jfrog https://charts.jfrog.io
helm repo update
```

Your repo contains only:

```text
helm-repo-jenkins-jfrog/
├── README.md
├── common/
│   ├── namespaces.yaml
│   └── storageclass-gp3.yaml
├── values/
│   ├── jenkins-values.yaml
│   └── jfrog-values.yaml
├── ingress/
│   ├── jenkins-ingress.yaml
│   └── jfrog-ingress.yaml
└── scripts/
    ├── 00-check.sh
    ├── 01-common.sh
    ├── 02-install-jenkins.sh
    ├── 03-install-jfrog.sh
    ├── 04-port-forward-jenkins.sh
    ├── 05-port-forward-jfrog.sh
    └── 06-apply-ingress.sh
```

## Execution

```bash
chmod +x scripts/*.sh

./scripts/00-check.sh
./scripts/01-common.sh
./scripts/02-install-jenkins.sh
./scripts/03-install-jfrog.sh
```

## Test Jenkins locally

```bash
./scripts/04-port-forward-jenkins.sh
```

Open:

```text
http://localhost:8080
```

## Test JFrog locally

```bash
./scripts/05-port-forward-jfrog.sh
```

Open:

```text
http://localhost:8082
```

## Apply Ingress

Before applying ingress, edit:

```text
ingress/jenkins-ingress.yaml
ingress/jfrog-ingress.yaml
```

Replace:

```text
jenkins.example.com
artifactory.example.com
```

Then run:

```bash
./scripts/06-apply-ingress.sh
```

## Troubleshooting Pending Pods

Check pod events:

```bash
kubectl describe pod <pod-name> -n <namespace>
kubectl get events -n <namespace> --sort-by=.lastTimestamp
```

If you see:

```text
storageclass.storage.k8s.io "gp3" not found
```

Run:

```bash
kubectl apply -f common/storageclass-gp3.yaml
kubectl get storageclass
```

Also check EBS CSI driver:

```bash
kubectl get pods -n kube-system | grep ebs
```
