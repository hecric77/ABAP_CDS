@AbapCatalog.sqlViewName: 'ZV_16_HRG'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airlines Metadatos'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view ZB_16_AIRL_M_HRG
  with parameters
    p_AirlineCode :s_carr_id
  as select from scarr
{
      @UI.dataPoint.title: 'CDS - Airline code'
  key carrid   as Airline,
      currcode as AirlineCurrency
}
where
  carrid = $parameters.p_AirlineCode
