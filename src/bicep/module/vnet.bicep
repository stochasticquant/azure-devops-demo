param vnetName string

@description('Resource tags')
var templateModuleTags = {
  MusaConsulting: 'Project1'
  CostCentre: 'MusaConsulting'
  Status: 'Demo'
  Owner: 'Charles Sambo'
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: vnetName
  tags: templateModuleTags
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
}

output vnetName string = vnet.name
output vnetId string = vnet.id
output vnetAddressSpace array = vnet.properties.addressSpace.addressPrefixes
