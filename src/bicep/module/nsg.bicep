param nsgName string
param subnetId string

@description('Resource tags')
var templateModuleTags = {
  MusaConsulting: 'Project1'
  CostCentre: 'MusaConsulting'
  Status: 'Demo'
  Owner: 'Charles Sambo'
}


resource nsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: nsgName
  tags: templateModuleTags
  location: resourceGroup().location
}

resource nsgAssociation 'Microsoft.Network/virtualNetworks/subnets/networkSecurityGroup@2023-05-01' = {
  name: '${subnetId}/nsg'
  tags: templateModuleTags
  properties: {
    id: nsg.id
  }
}

output nsgName string = nsg.name
output nsgId string = nsg.id
