@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Composite view: Travel with agency'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}


define view entity ZI_123456_TravelwithAgency

    
 as select from ZI_123456_Travel as Travel
  association [1] to ZI_123456_AGENCY as _Agency on  Travel.AgencyID  = _Agency.AgencyID
                                             
 
  
{
 
  key Travel.TravelId,
      Travel.AgencyID,
      dats_days_between(BeginDate,EndDate)  as Duration,
      @Semantics.amount.currencyCode: 'CurrencyCode' 
      Travel.Price,
      Travel.CurrencyCode,
      Travel.Description,
      Travel.Status,
      
      _Agency
      
          
}
