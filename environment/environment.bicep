targetScope = 'subscription'

param environmentLocation string ='westeurope'

resource sampleApplicationResourceGroupReference 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'rg-devops-practices-sample-application-prod'
  location: environmentLocation
}

module sampleApplicationResourceGroupModule 'br:crinfrastructuremodules.azurecr.io/infrastructure/applications/sample-application:1.0.0' = {
  name: 'rg-devops-practices-sample-application-rg'
  scope: resourceGroup(sampleApplicationResourceGroupReference.name)
}
