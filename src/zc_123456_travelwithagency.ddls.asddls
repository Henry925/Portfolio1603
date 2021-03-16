@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption view: Travel with Agency'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
      
}
@Search.searchable: true
@Metadata.allowExtensions: true

define view entity ZC_123456_travelwithagency as select from ZI_123456_TravelwithAgency {
    
    key TravelId,
    Duration,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    Description,
    Status,
    AgencyID,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    _Agency.AgencyName as AgencyName,
    _Agency.CountryCode as CountryCode,
    _Agency.Address as AgencyAddress,
    _Agency.phoneNumber as AgencyPhoneNumber,
    _Agency.emailAddress as AgencyEmailAddress
    
   
  
}
