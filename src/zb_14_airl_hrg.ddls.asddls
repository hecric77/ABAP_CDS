@AbapCatalog.sqlViewName: 'ZV_14_AIRL_HRG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airline'
@Metadata.ignorePropagatedAnnotations: true
@VDM: {
    viewType: #BASIC
}
define view ZB_14_AIRL_HRG
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
