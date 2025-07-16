*&---------------------------------------------------------------------*
*& Report z15_tf_flights_hrg
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z15_tf_flights_hrg.

SELECT FROM ztf_flights_hrg( airlinecode = 'LH' )
       FIELDS *
       INTO TABLE @DATA(gt_results).

cl_demo_output=>display( gt_results ).
