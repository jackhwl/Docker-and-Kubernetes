## Section 2: Using the AzureRM Provider
* Terraform for the Azure Admin

ARM Template|Terraform
---|---
JSON|HCL
Parameters|Variables
Variables|Local variables
Resources|Resources
Functions|Functions
Nested templates|Modules
Explicit dependency|Automatic dependency
Refer by reference or resourceId|Refer by resource or data source

* Azure Providers: Azure (deprecated), Azure Stack, Azure Active Directory
* Authentication: Azure CLI, Managed Service Identity, Service principal with client secret, Service principal with certificate
* AzureRM Providers
```
provider "azurerm" {
  version         = "~> 1.0"
  alias           = "networking"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}
```

Environment Variables|Comment
---|---
ARM_CLIENT_ID|Service principal ID
ARM_CLIENT_SECRET|Service principal secret
ARM_ENVIRONMENT|Azure environment: public, Gov., etc
ARM_SUBSCRIPTION_ID|Azure subscription ID
ARM_TENANT_ID|Azure AD tenant ID for service principal
ARM_USE_MSI|Use Managed Service Identity

* Deploying a Virtual Network
* Reviewing the Virtual Network Config