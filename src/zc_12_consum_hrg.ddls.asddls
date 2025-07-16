@AbapCatalog.sqlViewName: 'ZV_12_HRG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista de consumo'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
@OData.publish: true
define view zc_12_consum_hrg
  as select from zi_11_cube_hrg
{
      @AnalyticsDetails.query.axis: #ROWS
  key Airline,
      @AnalyticsDetails.query.axis: #ROWS
  key FlightConnection,
      @AnalyticsDetails.query.axis: #ROWS
  key FlightDate,
      @AnalyticsDetails.query.axis: #COLUMNS
      FlightPrice,
      @AnalyticsDetails.query.axis: #COLUMNS
      Currency,
      @AnalyticsDetails.query.axis: #COLUMNS
      MaxNumberOfSeats,
      @AnalyticsDetails.query.axis: #COLUMNS
      NumberOfOccupiedSeats,
      @AnalyticsDetails.query.axis: #COLUMNS
      @DefaultAggregation: #FORMULA
      @EndUserText.label: 'Available Seats'
      MaxNumberOfSeats - NumberOfOccupiedSeats as NumberOfAvailableSeats,
      @AnalyticsDetails.query.axis: #COLUMNS
      TotalAmount
}
