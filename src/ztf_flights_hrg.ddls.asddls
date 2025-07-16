@EndUserText.label: 'Flights - Table Functions'
define table function ztf_flights_hrg
  with parameters
    @Environment.systemField: #CLIENT
    clnt        : abap.clnt,
    AirlineCode : s_carr_id
returns
{
  Client      : abap.clnt;
  AirlineName : s_carrname;
  FlightConn  : s_conn_id;
  CityFrom    : s_from_cit;
  CityTo      : s_to_city;

}
implemented by method
  zcl_table_func_hrg=>get_flights;         
