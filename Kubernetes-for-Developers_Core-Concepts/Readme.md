## Section 2: Kubernetes from a Developer Perspective
* * kubectl version --output=yaml
* * kubectl cluster-info
* * kubectl get all
* * kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
* * [Creating a Service Account, Creating a ClusterRoleBinding](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md)
* * kubectl -n kubernetes-dashboard create token admin-user (Getting a Bearer Token)
* * kubectl proxy
* * https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/
* Geting Started with kubectl
* Web UI Dashboard
* Set-Alias -Name k -Value kubectl
* alias k="kubectl" (Mac/Linux)
## Section 3: Creating Pods
* * k create -f .\nginx.pod.yml --save-config
* * k get pods
* * k delete -f .\nginx.pod.yml
* kubectl and YAML
* k apply -f .\nginx-readiness-probe.pod.yml
* k describe pod my-nginx
* k exec my-nginx -it sh
* Pod Health in Action
## Section 4: Creating Deployments
* kubectl Deployments in Action
* k create -f .\nginx.deployment.yml --save-config
* k apply -f nginx.pod.yml
* k describe deployment
* k get deploy
* k get deployments --show-labels
* k scale -f .\nginx.deployment.yml --replicas=4
* k delete -f .\nginx.deployment.yml
## Section 5: Creating Services
* Creating a Service with kubectl
* k port-forward pod/my-nginx-576498859f-jhztg 8080:80
* k port-forward deployment/my-nginx 8080:80