/*
Set your subscription:
az account set --subscription "SUBSCRIPTIONNAME"
az deployment sub create -c --location eastus --template-file ./resourceGroups.bicep --parameters prodenv=false
*/


targetScope = 'subscription'

@description('Identifier for the resource group RG-CTG-XXXXXXXXX-DEV')
param rgproject string = 'Christies-Checkout-Service'
param location string = 'eastus'
param prodenv bool = false
param project string = 'Christies Checkout Service API '
param dateCreated string = utcNow('d')

param devenvironments array = [
  'DEV'
  'SIT'
  'UAT'
  ]

param prodenvironments array = [
    'PROD'
    ]
 

@description('Common tags for each object created')
param commonTags object = {
    Description: 'resources supporting the ${project}'
    Product: 'Christies Checkout Service'
    Tier: 'Gold'
    'Code Repo': 'christies/christies-checkout-services'
    'Devops Project': 'christiestech/Christies-Checkout-Services '
    'Product Owner': 'Will Fischer'
    'Tech Lead': 'Justin Blackwell'
    'Created By': 'Devops Team'
    'Cost Center': 'CTG'
    'Date Created': dateCreated
  }



resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = [for env in (prodenv == true ? prodenvironments : devenvironments) :{
  name: 'RG-CTG-${rgproject}-${env}'
  location: location
  tags: commonTags
  
}]
