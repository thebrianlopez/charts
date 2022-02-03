

# helm repo remove argo-cd https://argoproj.github.io/argo-helm 
helm repo remove argo-cd
helm repo remove kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo remove bitnami             	https://charts.bitnami.com/bitnami
helm repo remove artifact-hub        	https://artifacthub.github.io/helm-charts
helm repo remove astronomer          	https://helm.astronomer.io/
helm repo remove datadog             	https://helm.datadoghq.co


#kubectl --context kind-kind --namespace default delete namespace argocd-local
kind delete cluster 
