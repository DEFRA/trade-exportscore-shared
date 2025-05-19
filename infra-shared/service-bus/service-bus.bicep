//imports
import * as comTypes from 'br/commonRegistry:commontypes:0-latest'
import * as comFuncs from 'br/commonRegistry:commonfunctions:0-latest'

// General parameters
param name string
param location string
param createdDate string = utcNow('yyyy-MM-dd')
param roleAssignments array = []
param skuName string
param serviceBusQueueName string
param triggerServiceBusQueueName string

// Tags
param environmentTag string
param serviceCodeTag string
param serviceNameTag string
param serviceTypeTag string

// The following params are for the Private Endpoint
param vnetName string
param subnetName string
param vnetRg string

param peArray comTypes.privateEndpointArrayType

//Existing Resource Data Sources
resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' existing = {
  scope: resourceGroup(vnetRg)
  name: vnetName
}

resource peSubnet 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' existing = {
  parent: vnet
  name: subnetName
}

// Module definition
module serviceBus 'br/public:avm/res/service-bus/namespace:0.13.0' = {
  name: name
  params: {
    name: name
    privateEndpoints: comFuncs.buildPrivateEndpointArray(peArray, name, peSubnet.id)
    location: location
    roleAssignments: roleAssignments
    minimumTlsVersion: '1.2'
    disableLocalAuth: false
    tags: {
      Name: name
      Location: location
      Environment: environmentTag
      ServiceCode: serviceCodeTag
      ServiceName: serviceNameTag
      ServiceType: serviceTypeTag
      CreatedDate: createdDate
      Tier: 'Shared'
    }
    authorizationRules: [
      {
        name: 'RootManageSharedAccessKey'
        rights: [
          'Listen'
          'Manage'
          'Send'
        ]
      }
    ]
    enableTelemetry: true
    queues: [
      {
        authorizationRules: [
          {
            name: 'RootManageSharedAccessKeyQueue'
            rights: [
              'Listen'
              'Manage'
              'Send'
            ]
          }
        ]
        name: serviceBusQueueName
        roleAssignments: roleAssignments // Reused parent resource roleAssignements for testing, can be split for finer control
      }
      {
        authorizationRules: [
          {
            name: 'RootManageSharedAccessKeyQueue'
            rights: [
              'Listen'
              'Manage'
              'Send'
            ]
          }
        ]
        name: triggerServiceBusQueueName
        roleAssignments: roleAssignments // Reused parent resource roleAssignements for testing, can be split for finer control
      }
    ]
    skuObject: {
      name: skuName
    }
  }
}
