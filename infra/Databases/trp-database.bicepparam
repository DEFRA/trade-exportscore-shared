using 'trp-database.bicep'

param location = '#{{ location }}'

param serverName = '#{{ environmentLower }}#{{ project-lower }}#{{ nc-function-database-lower }}#{{ nc-resource-postgres }}#{{ subscriptionNumber }}#{{ regionNumber }}01'

 param databases = [
  {
    name: 'eutd-trade-exports-core-trade-exportscore'
   }]

param collation = 'en_US.utf8'

param charset = 'UTF8'
