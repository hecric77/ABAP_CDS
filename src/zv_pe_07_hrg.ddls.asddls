@AbapCatalog.sqlViewName: 'ZV_PE_01_HRG'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Path Expressions'
define view zv_pe_07_hrg
  as select from scarr
  association to zv_pe_06_hrg as _flights on  scarr.mandt  = _flights.mandt
                                          and scarr.carrid = _flights.carrid
{
  _flights,
  scarr.mandt,
  scarr.carrid,
  scarr.carrname
}
