targetScope = 'resourceGroup'


@description('Input. Vnet name')
param vnetName string

module vnet 'module/vnet.bicep' = {
  name: 'vnetDeployment'
  params: {
    vnetName: vnetName
  }
}

@description('Input. Subnet name')
param subnetName string

module subnet 'module/subnet.bicep' = {
  name: 'subnetDeployment'
  params: {
    vnetName: vnet.outputs.vnetName
    subnetName: subnetName
  }
}

@description('Input. NSG name')
param nsgName string

module nsg 'module/nsg.bicep' = {
  name: 'nsgDeployment'
  params: {
    nsgName: nsgName
    subnetId: subnet.outputs.subnetId
  }
}

output vnetInfo object = {
  vnetName: vnet.outputs.vnetName
  vnetId: vnet.outputs.vnetId
  addressSpace: vnet.outputs.vnetAddressSpace
}

output subnetInfo object = {
  subnetName: subnet.outputs.subnetName
  subnetId: subnet.outputs.subnetId
  addressPrefix: subnet.outputs.subnetAddressPrefix
}

output nsgInfo object = {
  nsgName: nsg.outputs.nsgName
  nsgId: nsg.outputs.nsgId
}
