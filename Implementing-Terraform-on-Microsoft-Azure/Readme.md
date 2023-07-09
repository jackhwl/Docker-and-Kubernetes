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
* Deploying the Config with Cloud Shell
* * in Azure Cloud Shell
* * terraform init
* * terraform plan -var resource_group_name=vnet-main -out vent.tfplan
* * terraform apply "vent.tfplan"

## Section 3: Creating Multiple Providers
* Using Multiple Instances
* Security Network Deployment: security subscription, security-vnet has peering relationship with other vnet
* Using the Azure AD Provider:
```
provider "azure_ad" {
  version         = "~> 1.0"
  alias           = "networking"
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
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

* Reviewing the Security Configuration
* * Create a Terraform VM

## Section 4: Using Azure for Remote State
* Remote State Refresher
* Azure Storage for Remote State: Supports locking, workspaces, multiple auth methods
* Authentication Methods: 
1. Managed Service Identity: use_msi
2. Shared access signature token: sas_token
3. Storage access key: access_key
4. Service principal: client_id
* Azure Storage Setup:
* Deploying Azure Storage for Remote State
* Migrating Remote State
* Implementing Remote State Migration

## Section 5: Using Azure DevOps
* Infrastructure as Code Fundamentals
* * Source Control Management: 
    - Multiple formats - Git, TFVC, Subversion
    - Multiple platforms - GitHub, BitBucket, GitLab, Azure DevOps
    - Enable collaboration
    - Version controlled
* * CI/CD Pipelines:
    - Multiple platforms - Jenkins, Azure DevOps, Bamboo
    - Continuous Integration for code check-in
    - Continuous Delivery of builds
    - Automated testing and validation
    - Multiple environments
      - Development, UAT, QA, Production
* * Terraform Workspaces
    - Common configuration
    - Individual state files
    - Multiple environments
    - terraform.workspace