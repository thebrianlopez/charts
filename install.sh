kind create cluster 

helm repo add argo-cd               https://argoproj.github.io/argo-helm
helm repo add kubernetes-dashboard  https://kubernetes.github.io/dashboard/
helm repo add bitnami             	https://charts.bitnami.com/bitnami
helm repo add artifact-hub        	https://artifacthub.github.io/helm-charts
helm repo add astronomer          	https://helm.astronomer.io/
helm repo add datadog             	https://helm.datadoghq.com

#helm dep update charts/argo-cd/

helm install \
  -f charts/argo-cd/values-global.yaml \
  argo-cd charts/argo-cd/ \
  --create-namespace \
  --dependency-update \
  --namespace argocd-local 

