using 'service-bus-queues.bicep' /*TODO: Provide a path to a bicep template*/


param namespaceName = '#{{ environment }}#{{ project }}#{{ nc-function-infrastructure }}#{{ nc_servicebus }}#{{ subscriptionNumber }}#{{ regionNumber }}01'
param location = '#{{ location }}'
param serviceBusQueueName = '#{{ containerName }}'
param triggerServiceBusQueueName = '#{{ triggerServiceBusQueueName }}'
param roleAssignments = []

