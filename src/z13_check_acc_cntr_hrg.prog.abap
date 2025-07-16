*&---------------------------------------------------------------------*
*& Report z13_check_acc_cntr_hrg
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z13_check_acc_cntr_hrg.

SELECT FROM zb_13_airl_hrg
       FIELDS *
       ORDER BY AirlineLocalCurrency
       INTO TABLE @DATA(gt_results).

IF sy-subrc EQ 0.
  cl_demo_output=>display( gt_results ).
ELSE.
  WRITE 'No hay datos para listar'.
ENDIF.
