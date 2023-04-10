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
## minikube version
* m delete
* m start
* m addons enable ingress
* 127.0.0.1 frontend.minikube.local
* 127.0.0.1 backend.minikube.local
## docker-desktop version
* [install ingress](https://kubernetes.github.io/ingress-nginx/deploy/)
* 127.0.0.1 frontend.minikube.local
* 127.0.0.1 backend.minikube.local
* docker run --init --rm --publish 4200:4200 jackhwl/frontend:1.0

* helm upgrade demo-guestbook guestbook
* k describe pod -l app=frontend
* helm status demo-guestbook
* helm rollback demo-guestbook 1
* helm history demo-guestbook
* Demo: Installing a Helm Chart

* docker build --tag jackhwl/backend:2.0 .
* docker push jackhwl/backend:2.0

* delete ingress to free up IIS
* k delete all --all -n ingress-nginx
* [install ingress](https://kubernetes.github.io/ingress-nginx/deploy/)

* helm install demo-guestbook guestbook
* helm upgrade demo-guestbook guestbook
* k get pods
* helm get manifest demo-guestbook 
* Demo: Building an Umbrella Helm Chart

## Section 6: Customizing Charts with Helm Templates
* Demo: Customizing Frontend Chart Values
* helm uninstall demo-guestbook
* helm template guestbook
* helm install demo-guestbook guestbook --dry-run --debug
* view single pod error log
* k logs pod/demo-guestbook-backend-689b5b8498-6fscd
* helm template guestbook
* Demo: Adding Template Logic
* Demo: Installing Dev and Test Release

## Section 7: Managing Dependencies
* helm package chart_name
* helm package frontend backend database
* helm repo index .
* run chartmuseum server
* docker run --rm -it   -p 8080:8080   -e DEBUG=1   -e STORAGE=local   -e STORAGE_LOCAL_ROOTDIR=./charts   -v c:\Jack\chartmuseum\charts:/charts   ghcr.io/helm/chartmuseum:v0.14.0
* cp *.tgz c:\Jack\chartmuseum\charts
* http://localhost:8080/api/charts
* http://localhost:8080/charts/backend-1.2.2.tgz
* helm download repo to chart directory
* helm dependency update guestbook
* helm dependency list guestbook
* Defining Dependencies
* All charts are downloaded with "helm dependency update", partial installation with "helm install",
* "--set .." overrides value.yaml, conditions override tags.
* helm repo add chartmuseum http://localhost:8080
* helm repo list
* helm repo update
* helm search repo chartmuseum
* helm get manifest dev
* Demo: Managing Dependencies
* helm install dev guestbook --set backend.enabled=false --set database.enabled=false
* helm install dev guestbook --set tags.api=false
* Demo: Controlling Dependencies with Conditions and Tags

## Section 8: Using Existing Helm Chart
* helm search repo mongodb
* helm dependency update guestbook
* solve policy/v1beta1 issue in kubernetes 1.25
* helm pull "stable/mongodb" --untar
* change "policy/v1beta1" to "policy/v1"
* helm package mongodb
* https://artifacthub.io/ search for wordpress
* helm install demo-wordpress stable/wordpress
* Demo: Installing Wordpress in Kubernetes in 1 Minute