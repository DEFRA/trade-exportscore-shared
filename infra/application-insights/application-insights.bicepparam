using 'application-insights.bicep'

param name = '#{{ environment }}#{{ project }}#{{ nc-function-infrastructure }}#{{ nc-resource-appinsights }}#{{ subscriptionNumber }}#{{ regionNumber }}01'

param lawName = '#{{ environment }}#{{ project }}#{{ nc-function-infrastructure }}#{{ nc_loganalytics }}#{{ subscriptionNumber }}#{{ regionNumber }}01'

param tags = {
  Tier: 'Shared'
  Location: '#{{ location }}'
  Environment: '#{{ environmentTag }}'
  ServiceCode: '#{{ serviceCodeTag }}'
  ServiceName: '#{{ serviceNameTag }}'
  ServiceType: '#{{ serviceTypeTag }}'
  Repo: '#{{ Build.Repository.Uri }}'
}
