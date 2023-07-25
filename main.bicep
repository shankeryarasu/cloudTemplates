az deployment group create --resource-group <resource-group-name> --template-file main.bicep --parameters parameters.json

az deployment group create --resource-group <resource-group-name> --template-file main.bicep --parameters parameters.json --mode WhatIf


// Import the modules
module network './networkModule.bicep' = {
  name: 'network'
  params: {
    vnetName: 'myVnet'
    subnetName: 'mySubnet'
    location: 'East US'
    addressPrefix: '10.0.0.0/16'
    subnetPrefix: '10.0.0.0/24'
  }
}

module vm './vmModule.bicep' = {
  name: 'vm'
  params: {
    vmName: 'myVM'
    location: 'East US'
    subnetResourceId: network.outputs.subnetResourceId
    vmAdminPassword: 'ReplaceWithYourPassword'
  }
}
