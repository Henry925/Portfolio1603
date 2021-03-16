@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_123456_Travel
  as select from /dmo/travel
{
  key travel_id     as TravelId,
  agency_id as AgencyID,
      customer_id   as CustomerId,
      begin_date    as BeginDate,
      end_date      as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
       currency_conversion(
        amount => total_price,
        source_currency => currency_code,
        target_currency => cast('EUR' as abap.cuky),
        exchange_rate_date => begin_date,
        error_handling => 'SET_TO_NULL')        as Price,   
       cast('EUR' as abap.cuky)                  as CurrencyCode,
        
      
      
      description   as Description,
      status        as Status
}

