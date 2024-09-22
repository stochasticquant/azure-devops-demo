param vnetName string

resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: vnetName
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
