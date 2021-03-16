@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Agency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_123456_AGENCY as select from /dmo/agency {
    key agency_id as AgencyID,
    
    name         as  AgencyName,
   country_code  as CountryCode,
  concat_with_space( concat_with_space(street, postal_code,1),city,1)  as Address,
  phone_number  as phoneNumber,
  email_address as emailAddress
    
}

where
 
country_code <> 'UK'
