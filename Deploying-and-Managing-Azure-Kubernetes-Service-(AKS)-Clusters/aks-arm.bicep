param clusterName string = 'akscluster'

@minValue(1)
@maxValue(50)
param agentCount int = 3
param agentVMSize string = 'Standard_B2s'
param sshRSAPublicKey string

resource cluster 'Microsoft.ContainerService/managedClusters@2020-03-01' = {
  name: clusterName
  location: resourceGroup().location
  properties: {
    dnsPrefix: 'aks'
    agentPoolProfiles: [
      {
        name: 'agentpool'
        count: agentCount
        vmSize: agentVMSize
      }
    ]
    linuxProfile: {
      adminUsername: 'aksadmin'
      ssh: {
        publicKeys: [
          {
            keyData: sshRSAPublicKey
          }
        ]
      }
    }
  }
  identity: {
    type: 'SystemAssigned'
  }
}

output controlPlaneFQDN string = cluster.properties.fqdn