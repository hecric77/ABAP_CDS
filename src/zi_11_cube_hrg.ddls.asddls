@AbapCatalog.sqlViewName: 'ZV_11_HRG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista intermedia'
@Metadata.ignorePropagatedAnnotations: true
@Analytics:{
dataCategory: #CUBE
}
@VDM:{
viewType: #COMPOSITE
}
define view zi_11_cube_hrg
  as select from sflight
  association [0..1] to zb_10_spfli_hrg as _FlightConnection on  $projection.Airline          = _FlightConnection.Carrid
                                                             and $projection.FlightConnection = _FlightConnection.Connid
{
  key sflight.carrid     as Airline,
  key sflight.connid     as FlightConnection,
  key sflight.fldate     as FlightDate,
      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #MIN
      sflight.price      as FlightPrice,
      @Semantics.currencyCode: true
      sflight.currency   as Currency,
      @DefaultAggregation: #SUM
      sflight.seatsmax   as MaxNumberOfSeats,
      @DefaultAggregation: #SUM
      sflight.seatsocc   as NumberOfOccupiedSeats,
      @Semantics.amount.currencyCode: 'Currency'
      @DefaultAggregation: #SUM
      sflight.paymentsum as TotalAmount,
      /*Association*/
      _FlightConnection

}
