param vnetName string
param subnetName string

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: '${vnetName}/${subnetName}'
  properties: {
    addressPrefix: '10.0.0.0/24'
  }
}

output subnetName string = subnet.name
output subnetId string = subnet.id
output subnetAddressPrefix string = subnet.properties.addressPrefix
