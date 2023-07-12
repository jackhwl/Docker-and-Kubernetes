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
  - Using PS: Install-Module -name AzureRM -Verbose -Force
    - $webAsg = New-AzureRmApplicationSecurityGroup -ResourceGroupName WenlinVNetRG -Name myAsgWebServers -Location eastus
    - $mgmtAsg = New-AzureRmApplicationSecurityGroup -ResourceGroupName WenlinVNetRG -Name myAsgMgmtServers -Location eastus
    - $webRule = New-AzureRmNetworkSecurityRuleConfig `
        -Name "Allow-Web-All" `
        -Access Allow `
        -Protocol Tcp `
        -Direction Inbound `
        -Priority 100 `
        -SourceAddressPrefix Internet `
        -SourcePortRange * `
        -DestinationApplicationSecurityGroupId $webAsg.id `
        -DestinationPortRange 80,443
    - $mgmtRule = New-AzureRmNetworkSecurityRuleConfig `
        -Name "Allow-RDP-All" `
        -Access Allow `
        -Protocol Tcp `
        -Direction Inbound `
        -Priority 110 `
        -SourceAddressPrefix Internet `
        -SourcePortRange * `
        -DestinationApplicationSecurityGroupId $mgmtAsg.id `
        -DestinationPortRange 3389
    - $nsg = New-AzureRmNetworkSecurityGroup `
        -ResourceGroupName WenlinVNetRG `
        -Location eastus `
        -Name myNsg `
        -SecurityRules $webRule,$mgmtRule
* VM IP Addressing Best Practices
* Demo: Creating a Network Interface and Deploying a VM
  - replace vm vnic to custom vnic
