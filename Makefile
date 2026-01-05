
install-helm: |
	curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

add-nginx-helm-repo: |
	helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	helm repo update

apply-ingress-nginx-dev: |
	helm install ingress-nginx ingress-nginx/ingress-nginx \
	  --namespace ingress-nginx \
	  --create-namespace \
	  -f helm/ingress-nginx/values-dev.yaml

apply-ingress-nginx-prod: |
	helm install ingress-nginx ingress-nginx/ingress-nginx \
	  --namespace ingress-nginx \
	  --create-namespace \
	  -f helm/ingress-nginx/values-prod.yaml

upgrade-ingress-nginx-dev: |
	helm upgrade ingress-nginx ingress-nginx/ingress-nginx \
	  --namespace ingress-nginx \
	  -f helm/ingress-nginx/values-dev.yaml

clear-ingress-nginx: |
	helm uninstall ingress-nginx -n ingress-nginx
	kubectl delete namespace ingress-nginx