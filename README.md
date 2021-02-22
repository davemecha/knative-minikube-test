# knative-minikube-test

This repo demonstrates issues with running kubernetes within gitpod.io dev environments. All options are failing due to different problems. All seem to have to do with some lacking permissions.

I'm not sure if there may be some options, that I could pass to the tools to get a local dev environment of kubernetes running. I'm glad for help.

## start docker

For some tests the local docker environment should be started.

`sudo docker-up`

## [minikube](https://kubernetes.io/de/docs/setup/minikube/)

Start minikube with no driver

`minikube start --vm-driver=none --addons=ingress`

Start minikube with docker driver

`minikube start --driver=docker --addons=ingress`

Another option I did not try yet was using podman.

## [k3s](https://k3s.io/)

Install k3s

`curl -sfL https://get.k3s.io | sh -s - --disable traefik`

I downloaded the k3s shell script to digg into this. But unfortunately I'm not able to change this to replace the systemd requirement with the `sudo docker-up` command. Maybe someone has a hint how I can work around the systemd requirement here.

`./k3s.sh --disable traefik`

## [kind](https://kind.sigs.k8s.io/)

Start kind cluster

`kind create cluster --config=kind-config.yaml`

Not sure about the yaml. Maybe there are better options to choose.
