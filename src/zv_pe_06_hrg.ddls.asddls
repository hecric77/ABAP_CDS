@AbapCatalog.sqlViewName: 'ZV_PE_HRG'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Path Expressions'
define view zv_pe_06_hrg
  as select from spfli
  association        to sflight  as _flights  on  spfli.mandt  = _flights.mandt
                                              and spfli.carrid = _flights.carrid
                                              and spfli.connid = _flights.connid
  association [1..1] to sairport as _airports on  spfli.mandt    = _airports.mandt
                                              and spfli.airpfrom = _airports.id
{
  _flights,
  _airports,
  spfli.mandt,
  spfli.carrid,
  spfli.connid,
  spfli.airpfrom
}
