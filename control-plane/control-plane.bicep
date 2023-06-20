targetScope = 'subscription'

param resourceGroupName string = 'rg-devops-practices-control-plane'
param resourceGroupLocation string ='westeurope'

param containerRegistryName string = 'crinfrastructuremodules'
param containerRegistrySku string = 'Premium'

resource resourceGroupReference 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module resourceGroupModule 'control-plane-rg.bicep' = {
  name: 'rg-devops-practices-control-plane-rg'
  scope: resourceGroup(resourceGroupReference.name)
  params: {
    location: resourceGroupLocation
    containerRegistryName: containerRegistryName
    containerRegistrySku: containerRegistrySku
  }
}
