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