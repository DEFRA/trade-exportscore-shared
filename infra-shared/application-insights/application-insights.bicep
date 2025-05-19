//imports
import * as comTypes from 'br/commonRegistry:commontypes:0-latest'
import * as comFuncs from 'br/commonRegistry:commonfunctions:0-latest'

param name string
param lawName string
param date string = utcNow('yyyyMMdd')
param tags comTypes.tagsObject
param location string = resourceGroup().location

resource appInsightsName_resource 'Microsoft.Insights/components@2020-02-02' = {
  name: name
  location: location
  tags: comFuncs.tagBuilder(name, date, tags)
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Bluefield'
    Request_Source: 'rest'
    WorkspaceResourceId: resourceId('Microsoft.OperationalInsights/workspaces', lawName)
  }
}
