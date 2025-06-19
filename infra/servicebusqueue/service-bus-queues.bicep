param location string
param namespaceName string
param serviceBusQueueName string
param triggerServiceBusQueueName string
param roleAssignments array = []
// Shared access rights for queues
var sharedAccessRights = [
 'Listen'
 'Manage'
 'Send'
]
// Queue 1
resource primaryQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
 name: '${namespaceName}/${serviceBusQueueName}'
 location: location
 properties: {
   enablePartitioning: true
   authorizationRules: [
     {
       name: 'RootManageSharedAccessKeyQueue'
       rights: sharedAccessRights
     }
   ]
 }
}
// Queue 2 (Trigger Queue)
resource triggerQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
 name: '${namespaceName}/${triggerServiceBusQueueName}'
 location: location
 properties: {
   enablePartitioning: true
   authorizationRules: [
     {
       name: 'RootManageSharedAccessKeyQueue'
       rights: sharedAccessRights
     }
   ]
 }
}
