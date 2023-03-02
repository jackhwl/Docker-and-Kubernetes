## 3.2.3 Using kubectl create to create the pod
```
$ kubectl create -f kubia-manual.yaml
$ kubectl get po kubia-manual -o yaml
$ kubectl get pods
$ docker logs <container id>
$ kubectl logs kubia-manual
$ kubectl logs kubia-manual -c kubia
$ kubectl port-forward kubia-manual 8888:8080
$ kubectl get po --show-labels
$ kubectl get po -L creation_method,env
$ kubectl label po kubia-manual creation_method=manual
$ kubectl label po kubia-manual-v2 env=debug --overwrite
```
## 3.4 Listing subsets of pods through label selectors
## 3.5 Using labels and selectors to constrain pod scheduling
```
$ kubectl get po -l creation_method=manual
$ kubectl get po -l env
$ kubectl get po -l '!env'
creation_method!=manual 
env in (prod,devel)
env notin (prod,devel)
$ kubectl label node docker-desktop gpu=true
$ kubectl get nodes -l gpu=true
$ kubectl create -f kubia-gpu.yaml
```
## 3.6 Annotating pods
```
$ kubectl annotate pod kubia-manual mycompany.com/someannotation="foo bar"
$ kubectl describe pod kubia-manual
```
## 3.7 Using namespaces to group resources
```
$ kubectl get ns
$ kubectl get po --namespace kube-system
$ kubectl create -f custom-namespace.yaml
$ kubectl create namespace custom-namespace
$ kubectl create -f kubia-manual.yaml -n custom-namespace
```
## 3.8 Stopping and removing pods
```
$ kubectl delete po kubia-gpu
$ kubectl delete po -l creation_method=manual
$ kubectl delete po -l rel=canary
$ kubectl delete ns custom-namespace
$ kubectl delete po --all
$ kubectl delete all --all
```