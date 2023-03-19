## Discovering Helm
* Demo: Working without Helm
* docker build --tag jackhwl/frontend:1.0 .
## Section 4: Installing a Local Kubernetes Cluster with Helm
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
* helm uninstall demo-mysql
* helm env
## Section 5: Building Helm Charts
* Demo: Building a Helm Chart
* helm install demo-guestbook guestbook
* helm get manifest demo-guestbook
* m service frondend
* pod get service port from envorinment variables
* k exec pod/frontend-97856d7d-gvxc5 env
* curl not ping service ip
* service’s cluster IP is a virtual IP, and only has meaning when combined with the service port
* k describe svc frontend
* k get po --all-namespaces
* list ingress controller log 
* k logs -n ingress-nginx pod/ingress-nginx-controller-6bc476f787-tgb6g
* helm install & uninstall
* W10
```
1. To make sure you're starting on a clean slate, run `minikube delete`. Then run `minikube start`.
2. Next run `minikube addons enable ingress`
3. Run `kubectl get pods -n ingress-nginx`. You should see a list of three pods prefixed `ingress-nginx-*` if all went well
4. Edit /etc/hosts, adding the lines below:
127.0.0.1 frontend.minikube.local
127.0.0.1 backend.minikube.local
5. Deploy the helm chart with `helm install demo-guestbook guestbook`
6. Run `minikube tunnel`. You may be asked for your password. Enter it and then head on over to http://frontend.minikube.local/. Note that you will have to keep this terminal window running.
7. Profit!
```
* Mac
```
1. To make sure you're starting on a clean slate, run `minikube delete`. Then run `minikube start`.
2. Next run `minikube addons enable ingress`
3. Run `kubectl get pods -n ingress-nginx`. You should see a list of three pods prefixed `ingress-nginx-*` if all went well
4. Edit /etc/hosts, adding the lines below:
127.0.0.1 frontend.minikube.local
127.0.0.1 backend.minikube.local
5. Deploy the helm chart with `helm install demo-guestbook guestbook`
6.Run `minikube tunnel`.

7. Visit the url as normal.
```