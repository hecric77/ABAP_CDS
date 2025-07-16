@AbapCatalog.sqlViewName: 'ZV_07_HRG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Expose Airports'
@Metadata.ignorePropagatedAnnotations: true
@VDM: {
viewType: #BASIC
}
define view zb_07_exp_airport_hrg
  as select from spfli as Flight
  association [1] to zb_06_airports_hrg as _AirportFrom on Flight.airpfrom = _AirportFrom.AirportId
{
  carrid,
  connid,
  countryfr,
  cityfrom,
  airpfrom,
  _AirportFrom //Se esponen todos los campos del CDS asociado pero no se visualizan si le damos data preview, esto es para que quien ocupe esta CDS tenga acceso a toda la asociación ya que extan expuestos pero no visualizados
}
