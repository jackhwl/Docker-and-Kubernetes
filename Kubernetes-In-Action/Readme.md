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
# Replication and other controllers: deploying managed pods
## 4.1.2 Creating an HTTP-based liveness probe
```
$ kubectl logs mypod --previous
$ kubectl describe po kubia-liveness
```
## 4.2.2 Creating a ReplicationController
```
$ kubectl create -f kubia-rc.yaml
$ kubectl get rc
$ kubectl describe rc kubia
$ kubectl label pod kubia-njdzh type=special
$ k get po --show-labels
$ kubectl label pod kubia-njdzh app=foo --overwrite
$ kubectl edit rc kubia
```
## 4.2.6 Horizontally scaling pods
```
$ kubectl scale rc kubia --replicas=10
$ kubectl edit rc kubia
$ kubectl delete rc kubia --cascade=false
```
## 4.3 Using ReplicaSets instead of ReplicationControllers
```
$ k create -f kubia-replicaset.yaml
$ kubectl get rs
$ kubectl describe rs
$ kubectl delete rs kubia
```
## 4.4 Running exactly one pod on each node with DaemonSets
```
$ kubectl create -f ssd-monitor-daemonset.yaml
$ kubectl get ds
$ kubectl get node
$ kubectl label node minikube disk=ssd
$ kubectl get po
$ kubectl label node minikube disk=hdd --overwrite
```
