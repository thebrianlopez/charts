kubectl --context kind-kind --namespace argocd-local get secret argocd-initial-admin-secret -o json | jq -r .data.password | base64 -D
kubectl --context kind-kind --namespace argocd-local port-forward svc/argo-cd-argocd-server 8080:443
