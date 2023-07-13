## Section 2: Configuring Virtual Network Peering:
* Understand VNets:
  - Virtual Network (VNet): A communications and security boundary that enables Azure resources (virtual machines, storage accounts, App Services apps, Azure SQL Database instances) to communicate with each other securely.
* When multiple VNets Make Sense:
  - Saving Money: Share a network virtual appliance among several Vnets(service chaining)
  - Segmenting Workloads: NSGs and UDRs give you routing and traffic control
  - Securing Traffic: Private connectivity that uses the Microsoft backbone network
* When Azure VPN Gateways Make Sense:
  - Virtual Private Network (VPN): A secure connection over an unsecure medium. Azure site-to-site VPNs use IPSec/IKE tunnels.
  - VNet-to-VNet VPN: 
    - Create isolation or administrative boundaries
    - Provide cross-region geo-redundancy and replication securely
    - No traffic crosses the public Internet
    - Private IP addressing
  - VNet-to-VNet VPN Points to Ponder
    - Different pricing model from VNet peering
    - Make sure your VNet address spaces do not overlap
    - Global VNet peering means you no longer need a VPN gateway for cross-region connectivity
    
     

