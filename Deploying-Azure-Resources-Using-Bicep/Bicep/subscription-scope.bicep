targetScope = 'subscription'

resource bicepRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'wenlin_bicepRG'
  location: 'eastUS'
}
