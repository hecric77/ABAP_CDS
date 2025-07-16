@AbapCatalog.sqlViewName: 'ZV_06_HRG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airports'
@Metadata.ignorePropagatedAnnotations: true
@VDM: {
    viewType: #BASIC
}
@ObjectModel.representativeKey: 'AirportId'
define view zb_06_airports_hrg
  as select from sairport
{
  key id        as AirportId,
      name      as AirportName,
      time_zone as AirportTimeZone
}
