CLASS zcl_table_func_hrg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.

    CLASS-METHODS get_flights FOR TABLE FUNCTION ztf_flights_hrg.
ENDCLASS.



CLASS zcl_table_func_hrg IMPLEMENTATION.
  METHOD get_flights BY DATABASE FUNCTION FOR HDB LANGUAGE SQLSCRIPT
                     OPTIONS READ-ONLY
                     USING scarr spfli.

    RETURN SELECT airline.mandt as Client,
           airline.carrname as AirlineName,
           flight.connid as FlightConn,
           flight.cityfrom as CityFrom,
           flight.cityto as CityTo
           from scarr as airline
           inner join spfli as flight
            on airline.mandt = flight.mandt and
               airline.carrid = flight.carrid
           where airline.mandt = :clnt and
                 flight.carrid = :AirlineCode
           ORDER BY airline.mandt, flight.carrid, flight.connid;

  ENDMETHOD.

ENDCLASS.
