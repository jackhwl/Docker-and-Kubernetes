## Discovering Helm
* Demo: Working without Helm
* docker build --tag jackhwl/frontend:1.0 .
## Installing a Local Kubernetes Cluster with Helm
* [install minikube](https://minikube.sigs.k8s.io/docs/start/)
* minikube addons enable ingress
* minikube ip
* add minikube ip to etc/hosts
* 192.168.49.2 frontend.minikube.local
* 192.168.49.2 backend.minikube.local
* [install helm](https://github.com/helm/helm/releases)
* k config view
* helm install repo
* helm repo add stable https://charts.helm.sh/stable
* helm install demo-mysql stable/mysql