
@description('Required. Location for all resources.')
@allowed(['westeurope'])
param location string

@description('Required. Resource Group Name in which vnet is to be created')
param rgName string

@description('Required. The name of the Vnet')
param vnetName string

@description('Required. The name of the Subnet')
param subnetName string

@description('Required. The name of the NSG')
param nsgName string

@description('Required. The prefix to the NSG name')
param subnetPrefix string

@description('Required. The address space for the vnet')
param addressSpace string




resource vnet 'Microsoft.Network/virtualNetworks@2024-01-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [addressSpace]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
          networkSecurityGroup: {
            id: nsg.id
          }
        }
      }
    ]
  }

}

resource nsg 'Microsoft.Network/networkSecurityGroups@2024-01-01' = {
  name: nsgName
  location: location
  properties: {}
}

output vnetId string = vnet.id
output subnetId string = vnet.properties.subnets[0].id
output nsgId string = nsg.id
