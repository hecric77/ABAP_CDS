@AbapCatalog.sqlViewName: 'ZV_04_HRG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Association'
@Metadata.ignorePropagatedAnnotations: true
@VDM: {
    viewType: #BASIC
}
define view zb_04_flight_hrg
  with parameters
    p_airline  :abap.char( 2 ),
    p_language :abap.char( 1 )
  as select from spfli as Flight
  association [1] to zb_03_country_t_hrg as _CountryNameFrom on  $projection.CountryFromKey = _CountryNameFrom.CountryKey
                                                             and _CountryNameFrom.Language  = $parameters.p_language
  association [1] to zb_03_country_t_hrg as _CountryNameTo   on  Flight.countryto        = _CountryNameTo.CountryKey
                                                             and _CountryNameTo.Language = $parameters.p_language
{
  key Flight.carrid                as Airline,
  key Flight.connid                as FlightConnection,
      Flight.cityfrom              as CityFrom,
      Flight.countryfr             as CountryFromKey,
      _CountryNameFrom.CountryName as CountryNameFrom,
      Flight.cityto                as CityTo,
      Flight.countryto             as CountryToKey,
      _CountryNameTo.CountryName   as CountryNameTo
}
where
  Flight.carrid = $parameters.p_airline
