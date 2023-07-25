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
