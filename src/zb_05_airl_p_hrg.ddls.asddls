@AbapCatalog.sqlViewName: 'ZV_05_HRG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Association with param'
@Metadata.ignorePropagatedAnnotations: true
@VDM: {
viewType: #BASIC
}
define view zb_05_airl_p_hrg
  with parameters
    p_AirlineCodeA  :s_carr_id,
    p_LocalCurrency :s_currcode
  as select from sflight as Flight

  association [1] to zb_01_airl_hrg as _Airline on Flight.carrid = _Airline.Airline
{
  key Flight.carrid as Carrid,
  key Flight.connid as Connid,
  key Flight.fldate as Fldate,
      Flight.price  as Price,
      _Airline( p_AirlineCode:$parameters.p_AirlineCodeA )[AirlineLocalCurrency = $parameters.p_LocalCurrency].AirlineLocalCurrency,
      _Airline( p_AirlineCode:$parameters.p_AirlineCodeA ).AirlineUrl
}
where
  carrid = $parameters.p_AirlineCodeA
