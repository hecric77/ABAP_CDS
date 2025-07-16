@AbapCatalog.sqlViewName: 'ZV_15_HRG'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airlines Metadatos'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view zb_15_airl_m_hrg
  as select from scarr
{
  @UI.dataPoint.title: 'CDS - Airline code'
  key carrid   as Airline,
      currcode as AirlineCurrency
}
