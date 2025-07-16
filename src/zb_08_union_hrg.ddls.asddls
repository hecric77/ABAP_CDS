@AbapCatalog.sqlViewName: 'ZV_09_HRG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Union'
@Metadata.ignorePropagatedAnnotations: true
define view zb_08_union_hrg
  as select from zint_t100826
{
  key product_id  as ProductId,
      description as Description
}
union select from zext_t100826
{
  key product_id  as ProductId,
      description as Description
}

