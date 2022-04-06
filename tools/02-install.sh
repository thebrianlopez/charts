#!/bin/bash 

#cilium hubble enable

# helm repo remove argo-cd 
# helm repo add argo-cd https://argoproj.github.io/argo-helm

#helm install \
#  -f charts/argo-cd/values-default.yaml \
#  argocd charts/argo-cd \
#  --create-namespace \
#  --dependency-update \
#  --namespace argocd-local 
kubectl --context kind-kind --namespace default create namespace argocd
kubectl --context kind-kind --namespace argocd apply -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.3.3/manifests/install.yaml

