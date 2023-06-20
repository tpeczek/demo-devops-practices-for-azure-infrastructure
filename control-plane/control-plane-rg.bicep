targetScope = 'resourceGroup'

param location string
param containerRegistryName string
param containerRegistrySku string

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2022-12-01' = {
  name: containerRegistryName
  location: location
  sku: {
    name: containerRegistrySku
  }
  properties: {
    networkRuleSet: {
      defaultAction: 'Deny'
    }
    publicNetworkAccess: 'Disabled'
  }
}
