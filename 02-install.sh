#!/bin/bash 

#cilium hubble enable

helm repo add argo-cd https://argoproj.github.io/argo-helm

helm install \
  -f charts/argo-cd/values-default.yaml \
  argocd charts/argo-cd \
  --create-namespace \
  --dependency-update \
  --namespace argocd-local 

