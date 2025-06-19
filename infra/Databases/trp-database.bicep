param location string
param serverName string
param collation string 
param charset string 
param databases {
  name: string
}[]


resource postgresqlDatabase 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2022-01-20-preview' = [
 for dbName in databases:{
    name: '${serverName}/${dbName}'
    location: location
    properties: {
      charset: charset
      collation: collation
    }
 }
]
 