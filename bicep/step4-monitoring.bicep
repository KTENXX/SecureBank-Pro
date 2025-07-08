param location string = resourceGroup().location
param workspaceName string = 'sbp-law-kelvin'
param appInsightsName string = 'sbp-ai-kelvin'
param appServiceName string = 'sbp-webapp-kelvin'

// Create Log Analytics workspace
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: workspaceName
  location: location
  properties: {
    retentionInDays: 30
    features: {
      searchVersion: 1
      legacy: 0
    }
  }
}

// Create Application Insights connected to Log Analytics
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
}

// Reference existing App Service
resource appService 'Microsoft.Web/sites@2022-03-01' existing = {
  name: appServiceName
}

// Enable diagnostics for App Service
resource diagnosticSetting 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'appservice-diagnostics'
  scope: appService
  properties: {
    workspaceId: logAnalytics.id
    logs: [
      {
        category: 'AppServiceHTTPLogs'
        enabled: true
      }
    ]
    metrics: [
      {
        category: 'AllMetrics'
        enabled: true
      }
    ]
  }
}


