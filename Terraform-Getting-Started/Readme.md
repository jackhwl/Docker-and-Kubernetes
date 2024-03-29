## Section 2: What You Need to Know About Infrastruture as Code
## Section 3: Deploying Your First Terraform Configuration
* What is Terraform: Executable, Configuration files (.tf), Provider plugins, State data
* Installing Terraform: 
* Terraform Object Types: Providers, Resources：are the things you want to create in a target environment, Data sources: are a way to query information from a provider
* Configuration Block Syntax
* Terraform Workflow
* * terraform init
* * terraform plan
* * terraform apply
* * terraform destroy
*  Terraform v1.5.1 on windows_amd64
## Section 4: Using Input Variables and Outputs
* Input Variable Syntax: var.<name_label>
* Terraform Data Types: Primitive(string, number, bool), Collection(list, set, map), Structural(tuple, object), Any(list), Null
* Local Values Syntax:
``` 
locals {
  instance_prefix = "globo"
  common_tags = {
    company = "Globomantics"
    project = var.project
    billing_code = var.billing_code
  }
}
```
* * local.<key> local.instance_prefix, local.compon_tags.company
* Adding Locals to the Configuration
* Output Values Syntax
* Adding Outputs to the Configuraton
* Validate the Configuration
* * terraform fmt -check
* Using the Validate Command
* * terraform validate
* Supplying Variable Values: Default value, -var flag, -var-file flag, terraform.tfvars / terraform.tfvars.json, .auto.tfvars / .auto.tfvars.json, TF_VAR_client_secret=""
* * terraform plan -var=billing_code="ACCT82347923" -var=project="web-app"
* * Order of Evaluation: TF_VAR_ environment variable > terraform.tfvars / terraform.tfvar.json > .auto.tfvars / .auto.tfvars.json > -var-file flag > -var flag > Command line prompt
* Deploying the Updated Configuration
* * export TF_VAR_aws_access_key=YOUR_ACCESS_KEY
* * $env:TF_VAR_aws_access_key="YOUR_ACCESS_KEY"
## Section 5: Updating Your Configuration with More Resources
