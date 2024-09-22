param nsgName string
param subnetId string

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: nsgName
  location: resourceGroup().location
}

resource nsgAssociation 'Microsoft.Network/virtualNetworks/subnets/networkSecurityGroup@2023-05-01' = {
  name: '${subnetId}/nsg'
  properties: {
    id: nsg.id
  }
}

output nsgName string = nsg.name
output nsgId string = nsg.id
