@AbapCatalog.sqlViewName: 'ZV_03_HRG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country Text'
@Metadata.ignorePropagatedAnnotations: true
@VDM: {
    viewType: #BASIC
}
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'CountryKey'
define view zb_03_country_t_hrg
//  with parameters
//    p_CountryKey : land1
  as select from t005t
{
  key land1   as CountryKey,
      @Semantics.language: true
  key spras   as Language,
      @Semantics.text: true
      @EndUserText: {
      label: 'Country Name'
      }
      landx50 as CountryName
}

//where
//  land1 = $parameters.p_CountryKey
