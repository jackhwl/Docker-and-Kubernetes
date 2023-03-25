## Section 2: Integrating AKS and the Azure Container Registry
* Demo: Preparing the Demo Environment
$RG="viGlobal"
$AKSCluster="GB-AKS"
$Regin="eastus"
$Sub="5fdd6b4f-8693-494e-8c25-5d544c15583c"
$TenantName="aderant.onmicrosoft.com"
$ACR_NAME="viglobal"
* Demo: Integrating AKS and Azure Container Registeries
* az acr create -n $ACR_NAME -g $RG --sku Basic
* az acr list -o table
* az acr repository list -n $ACR_NAME -o table
* az acr import -n $ACR_NAME --source docker.io/jackhwl/frontend:1.0 -t frontend:1.0
* az acr repository show -n $ACR_NAME --repository frontend -o table
* az acr repository show-tags -n $ACR_NAME --repository frontend -o table
* az acr show -n $ACR_NAME -o table