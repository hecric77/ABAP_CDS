@AbapCatalog.sqlViewName: 'ZV_01_AIRL_HRG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airline'
@Metadata.ignorePropagatedAnnotations: true
@VDM: {
    viewType: #BASIC
}
define view zb_01_airl_hrg
  with parameters
    p_AirlineCode : s_carr_id
  as select from scarr
{
  key carrid   as Airline,
      @Semantics.currencyCode: true
      currcode as AirlineLocalCurrency,
      @Semantics.url: {
      mimeType: 'AirlineUrl'
      }
      url      as AirlineUrl
}

where
  carrid = $parameters.p_AirlineCode
