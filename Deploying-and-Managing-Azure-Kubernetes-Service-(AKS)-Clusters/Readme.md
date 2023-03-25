 
 ## Section 3 Build and Manage an AKS Cluster
 * Demo: Communicating with an AKS Cluster 
 ```
$RG="viGlobal"
$AKSCluster="GB-AKS"
$Regin="eastus"
$Sub="5fdd6b4f-8693-494e-8c25-5d544c15583c"
$TenantName="aderant.onmicrosoft.com"
$ACR_NAME="viglobal"
```
 * az login --scope https://management.core.windows.net//.default
 * az aks get-credentials --name AKS-PORTAL --resource-group AKSVI
 * az aks get-credentials -g $RG -n $AKS 
 * az aks list
 * Set-Alias -Name k -Value kubectl
 * k cluster-info
 * k get nodes -o wide
 * k config view
 * k config current-context

 * az login
 * az account set -s $Sub
 * # Create an RG AKS cluster first
 * az group create --name {group name} --location {azure region}
 * az group create -l $Region -n $RG
 * az aks create -g $RG -n $AKSCluster
 * # Get the credentials and check the connectivity
 * az aks get-credentials -g $RG -n $AKSCluster --overwrite-existing
 * k get nodes
 * DELETE AKS & RG
 * az aks delete -g AKSVI -n AKS-PORTAL
 * az group delete -n AKSVI
* Start, Stop AKS Cluster
* az aks stop -n $AKSCluster -g $RG 
* az aks show -n $AKSCluster -g $RG --query powerState
* az aks start -n $AKSCluster -g $RG 

* $SSH=(Get-Content ~\.ssh\id_rsa.pub)
* az Deployment group create -f aks-arm.json -g $RG --parameters sshRSAPublicKey=$SSH clusterName=GB-AKS2 agentCount=3
* az aks delete -g viglobal -n GB-AKS2