// Define the Free App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'interview-prep-plan'
  location: resourceGroup().location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
  kind: 'linux'
  properties: {
    reserved: true // Crucial flag for Linux hosting
  }
}

// Define the Web App linked to the plan
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'interview-prep-webapp-unique-name'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|18-lts' // Change to your preferred stack
    }
  }
}
