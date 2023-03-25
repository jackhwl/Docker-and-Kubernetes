 
 ## Section 3 Build and Manage an AKS Cluster
 * Demo: Communicating with an AKS Cluster 
 ```
$RG="AKSVI"
$AKS="AKS-PORTAL"
$Regin="eastus"
$Sub="5fdd6b4f-8693-494e-8c25-5d544c15583c"
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