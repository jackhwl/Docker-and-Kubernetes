## Section 3: What Is Kubernetes?
## Section 4: Kubernetes Architecture
## Section 5: Getting Kubernetes
## Section 6: Working with Pods
## Section 7: Kubernetes Services
* kubectl apply -f pod.yml
* Creating Services Declaratively
* kubectl expose pod hello-pod --name=hello-svc --target-port=8080 --type=NodePort
* k apply -f .\svc-nodeport.yml
* k describe svc ps-nodeport