## Section 2: Kubernetes Networking Fundamentals
* k config use-context $AKSCluster
* k describe nodes
* k get pods -o wide
* $PODNAME = $(kubectl get pods -o jsonpath='{ .items[0].metadata.name }')
* k exec -it $PODNAME -- route
* k exec -it $PODNAME sh
* k exec -it $PODNAME -- ip addr

* k get svc --namespace kube-system
* k describe deployment coredns --namespace kube-system | more
* k get configmaps --namespace kube-system coredns -o yaml | more

## Section 3: Configuring and Managing Application Access with Services
* Demo: Exposing and Accessing applications with Services -ClusterIP
* k get pods --show-labels
* Demo: Exposing and Accessing applications with Services -NodePort
* k apply -f .\frontend-service-nodeport.yaml
* Demo: Exposing and Accessing applications with Services -LoadBalancer
* k apply -f .\frontend-service-loadbalancer.yaml

## Section 4: Configuring and Managing Application Access with Ingress
