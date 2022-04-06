

helm repo remove argo-cd
helm repo remove cilium
helm repo remove astronomer
helm repo remove datadog

# kubectl --context kind-kind --namespace default delete namespace argocd-local
kind delete cluster
