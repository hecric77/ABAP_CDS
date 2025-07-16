@AbapCatalog.sqlViewName: 'ZV_02_HRG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Inner Join - Material.'
@Metadata.ignorePropagatedAnnotations: true
@VDM: {
    viewType: #BASIC
}
define view zb_02_mat_hrg
  with parameters
    p_storage : abap.char( 4 )
  as select from mara as Material

    inner join   marc as Plant           on Material.matnr = Plant.matnr

    inner join   mard as StorageLocation on  Plant.matnr = StorageLocation.matnr
                                         and Plant.werks = StorageLocation.werks
{
  key Material.matnr        as material,
      Plant.werks           as plant,
      StorageLocation.lgort as storage
}

where
  StorageLocation.lgort = $parameters.p_storage
