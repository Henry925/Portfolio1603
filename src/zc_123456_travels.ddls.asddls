@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption view: Travels'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
    define view entity ZC_123456_TRAVELS as select from ZI_123456_TravelwithAgency {
    
    key AgencyID,
    count(distinct TravelId) as NumberOfTravels,
    
          @Semantics.amount.currencyCode: 'CurrencyCode'
    
    avg(Price  as abap.dec(16,2)) as AveragePrice,
    CurrencyCode,
              @Semantics.amount.currencyCode: 'CurrencyCode'
    
    sum(Price) as TotalRevenue
}

where
    Status = 'B'

group by

AgencyID,
CurrencyCode

