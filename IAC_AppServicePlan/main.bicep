targetScope = 'subscription'

param location string = 'westus'
param resourceGroupName string = 'rg-juiceshop'
param appServicePlanName string = 'interview-prep-plan'
param webAppName string = 'juiceshop-nb-${uniqueString(subscription().id)}'

// Create Resource Group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

// Deploy App Service Plan and Web App inside RG
module resources 'appservice.bicep' = {
  name: 'appServiceDeploy'
  scope: rg
  params: {
    location: location
    appServicePlanName: appServicePlanName    // ← add this
    webAppName: webAppName                    // ← add this
  }
}
