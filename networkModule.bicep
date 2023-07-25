param vnetName string
param subnetName string
param location string
param addressPrefix string
param subnetPrefix string

resource vnet 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
        }
      }
    ]
  }
}

output vnetResourceId string = vnet.id
output subnetResourceId string = vnet.properties.subnets[0].id
