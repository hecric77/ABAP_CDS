@AbapCatalog.sqlViewAppendName: 'ZEV_09_HRG'
@EndUserText.label: 'CDS - Extend'
extend view zb_01_airl_hrg with zb_09_ext_air_hrg
{
  scarr.carrname as AirlineName
}
