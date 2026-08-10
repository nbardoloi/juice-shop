targetScope = 'subscription'

param rgLocation string = 'eastus'      // ← RG stays in eastus
param resourceLocation string = 'westus' // ← resources go to westus
param resourceGroupName string = 'rg-juiceshop'
param appServicePlanName string = 'interview-prep-plan'
param webAppName string = 'interview-prep-webapp-${uniqueString(subscription().id)}'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: rgLocation                  // ← eastus
}

module resources 'appservice.bicep' = {
  name: 'appServiceDeploy'
  scope: rg
  params: {
    location: resourceLocation          // ← westus
    appServicePlanName: appServicePlanName
    webAppName: webAppName
  }
}
