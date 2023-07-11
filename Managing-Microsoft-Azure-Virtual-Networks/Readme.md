## Section 2: Creating and Configuring an Azure Virtual Network
* Demo: Deploying a Virtual Network in Azure
  - [101-vent-two-subnets](https://github.com/Azure/azure-quickstart-templates/tree/master/quickstarts/microsoft.network/vnet-two-subnets)
* Configuring Network Security Groups
  - Network Security Groups (NSGs)
* Service Tags: 
  - Internet
  - VirtualNetwork
  - AzureLoadBalancer
  - AzureTrafficManager
  - Storage
  - SQL
  - AzureCosmosDB
  - AzureKeyVault
* Application Security Groups (ASGs)
* Demo: Creating an NSG
  - Using Bicep: az deployment group create --resource-group WenlinVNetRG --template-file .\nsg.bicep --parameters nsg_name=nsg_withRDP2 allow_rdp=true
