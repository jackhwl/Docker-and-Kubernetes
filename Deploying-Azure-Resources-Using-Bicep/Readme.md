## Section 2: Introduction to Bicep
* ARM Templates: Modular JSON Files with declarative Syntax for Infrastructure as Code
* * Desired State of Resources and their Properties
* * Any Azure Resource
* * Intelligent Orchestration
* * Testing and Preview
* * Full CI/CD and Tracking Support
* An ARM template refers to an Azure Resource Manager template. It is a JSON (JavaScript Object Notation) file used for deploying and managing resources in Azure. ARM templates provide a declarative syntax for defining the desired state of Azure resources, including virtual machines, storage accounts, networks, and more. With an ARM template, you can define the resource configuration, dependencies, and other deployment settings in a structured manner. This allows for consistent and repeatable deployments, infrastructure as code practices, and version control of your Azure resources.
* Bicep is a Domain-Specific Language (DSL) and a declarative language for defining Azure resource deployments. It is a high-level abstraction over Azure Resource Manager (ARM) templates, making it easier to write and manage infrastructure-as-code for Azure resources. Bicep uses a more concise and human-friendly syntax compared to JSON-based ARM templates, reducing the complexity and improving the developer experience.

With Azure Bicep, you can define and deploy Azure resources using a familiar programming language-like syntax. Bicep files have the .bicep extension and can be compiled into ARM templates that Azure understands. Bicep supports all the features and capabilities of ARM templates, allowing you to define resource properties, dependencies, parameters, variables, and more.

Azure Bicep offers several benefits, including improved readability, modularity, and maintainability of infrastructure code. It provides type safety, better tooling integration, and supports code reuse through modules. Bicep files can be used with deployment tools like Azure CLI, Azure PowerShell, and Azure DevOps pipelines to automate the deployment and management of Azure resources.

Overall, Azure Bicep simplifies the authoring and management of Azure resource deployments, making it easier for developers and infrastructure engineers to work with infrastructure-as-code in the Azure ecosystem.
* * Domain Specific Language
* * Focused on Azure resources and tasks
* * Transparent abstraction over ARM and ARM templates
* * Bicep code is transpiled to standard ARM Template JSON files
* * Easier to read and write than standard ARM Template JSON files
* What is Bicep
* az bicep install
* az bicep upgrade
* az bicep version
* Demo: Install Tooling:
* How is Bicep Different from ARM Templates?
* Contents of a Bicep File
* * param demoParam string ='Contoso'
* * var demoVar ='example value'
* * resource demoRes 'type' = {...}
* * output demoOutput string = demoRes.name

* * Provide values during deployment that allow the same template to be used with different environments
* * Define values that are reused in your templates. They can be constructed from parameter values
* * Specify the resources to deploy
* * Return values from the deployed resources
* bicep decompile .\arm-storage-account.json 
* az login --only-show-errors -o table --query Dummy
$subscription="5fdd6b4f-8693-494e-8c25-5d544c15583c"
$RG="wenlin_bicepRG"
$location="eastus"
* az account set -s $Subscription
# RG Scope
az deployment group create --resource-group $RG --template-file .\manual-arm-storage-account.bicep
# Need the RG first!
az group create --name $RG --location $location
az deployment group create --resource-group $RG --template-file .\manual-arm-storage-account.bicep --what-if
* The resources in your file must match the target scope, and the target scope must match the deployment command
* Demo: Authoring and Deploying Bicep
* Create an Azure resource group using Terraform
* * terraform init
* * terraform plan -out main.tfplan
* * terraform apply main.tfplan
* * terraform plan -destroy -out main.destroy.tfplan
* * terraform apply main.destroy.tfplan
## Section 3: Advanced Concepts in Bicep
* Demo: Parameters, Variables, and Outputs
* * az deployment group create --resource-group $RG --template-file .\storage-parameters.bicep
* * az deployment group create --resource-group $RG --template-file .\storage-parameters.bicep --parameters storage_name=storageaccount
* * az deployment group create --resource-group $RG --template-file .\storage-parameters.bicep --parameters storage_name=storageaccount234893247
* * az deployment group create --resource-group $RG --template-file .\storage-parameters.bicep --parameters prefix=store
* * az resource list --resource-group $RG -o table
* * az deployment group list --resource-group $RG -o table
* * az deployment group create --resource-group $RG --template-file .\storage-parameters.bicep --parameters prefix=store --name=newnamestorage
* Deploy with invalid SKU
* * az deployment group create --resource-group $RG --template-file .\storage-parameters.bicep --parameters prefix=store sku=Premium_ZRS
* Deploy with parameter file
* * az deployment group create --resource-group $RG --template-file .\storage-parameters.bicep --parameters @storage-parameters.param.json
* Create storage account with Terraform
* * terraform init
* * terraform plan -out .\main.tfplan
* * terraform apply .\main.tfplan
* * az deployment group create --resource-group $RG --template-file .\vnet.bicep --parameters vnetname=firstvnet
* Create vnet with Terraform
* * terraform fmt
* * terraform init
* * terraform plan
* * terraform apply -auto-approve
* [if you want to use existing RG, you need import it to terraform ](https://gmusumeci.medium.com/how-to-import-an-existing-azure-resource-in-terraform-6d585f93ea02)
* * az deployment group create --resource-group $RG --template-file .\aks.bicep --parameters tierType=test
* Conditional Deployment
* * az deployment group create --resource-group $RG --template-file .\nsg.bicep --parameters nsg_name=nsg_withRDP allow_rdp=true
* * az deployment group create --resource-group $RG --template-file .\nsg.bicep --parameters nsg_name=nsg_withoutRDP allow_rdp=false
* Check result
* * az network nsg list -g $rg -o table
* * az network nsg rule list -g $rg --nsg-name nsg_withRDP
* * az network nsg rule list -g $rg --nsg-name nsg_withoutRDP -o table
* Deploying Dependent Resources Through Bicep
* Delete RG
* * az group delete -g $RG --yes
* Extend our existing Subscription Scoped Bicep
* code .\subscription-scope.bicep
* Deploy RG
* * az deployment sub create --location $location --template-file .\subscription-scope.bicep --parameters RG_Name=$RG
* Check result
* * az network nsg rule list -g $rg --nsg-name nsg -o table
* Try with another RG
* using one single Bicep file, create a resource group and also a network security group with a rule in it
* * $RG_2="wenlin_bicepRG_2"
* * az group show -g $RG_2
* * az deployment sub create --location $location --template-file .\subscription-scope.bicep --parameters RG_Name=$RG_2
* * az network nsg rule list -g $RG_2 --nsg-name nsg -o table
* * az group delete -g $RG_2 --yes
* Demo: Conditional Deployments and Dependent Resources
* Deployment at Scale
# Deployment at scale 
```
$Vnets=5
# Powershell
for ($vnetno = 1 ; $vnetno -le $Vnets ; $vnetno++) {
    $Vnetname = "PSVNET_$Vnetno"
    az deployment group create --resource-group $RG --template-file .\vnet.bicep --parameters vnetname=$Vnetname
}
```
* Check Result
* * az network vnet list -g $RG -o table
* Bicep loop over range
* * az deployment group create --resource-group $RG --template-file .\vnet_at_scale.bicep --parameters vnet_prefix=bicepvnet vnet_count=$vnets
* Check Result
* * az network vnet list -g $RG -o table

* Bicep loop over array
* * az deployment group create --resource-group $RG --template-file .\vnet_array.bicep
* Check Result
* * az network vnet list -g $RG -o tsv
* Demo: Deployment at Scale

* Securing Bicep
* Create a KV and secret
$PW="P@ssw0rdP@ssw0rd"
$KVName= (az deployment group create --resource-group $RG --template-file .\keyvault.bicep `
    --parameters pw=$PW --query 'properties.outputs.kvname.value' -o tsv)
* * az keyvault secret show --vault-name $KVName --name adminpassword

* $sqlserver="sqlserver"+(Get-Random -Minimum 100000000 -Maximum 99999999999)

* * az deployment group create --resource-group $RG --template-file .\sql_kv.bicep `
--parameters sqlServerName=$sqlserver kvName=$KVName

* * az sql server firewall-rule create -g $RG -s $sqlserver -n 'Azure' --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0

* $Servername = $sqlserver + '.database.windows.net'
* sqlcmd -S $Servername -U sqladmin -P $PW -Q "SELECT @@VERSION"

* Delete RG
* * az group delete -g $RG --yes
* Demo: Securing Bicep with Keyvault