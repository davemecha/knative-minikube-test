# knative-minikube-test

## minikube

minikube start --vm-driver=none --addons=ingress
minikube start --driver=docker --addons=ingress

## k3s

curl -sfL https://get.k3s.io | sh -s - --disable traefik

## kind

kind create cluster --config=kind-config.yaml