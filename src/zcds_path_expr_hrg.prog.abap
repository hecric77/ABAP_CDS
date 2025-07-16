*&---------------------------------------------------------------------*
*& Report zcds_path_expr_hrg
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcds_path_expr_hrg.

DATA gv_carrid TYPE s_carr_id VALUE 'LH'.

cl_demo_input=>request( CHANGING field = gv_carrid ).

SELECT FROM zv_pe_07_hrg AS cds
       FIELDS cds~carrname AS carrname,
              \_flights-connid AS connid,
              \_flights\_flights-fldate AS fldate,
              \_flights\_airports-name AS name
       WHERE cds~carrid EQ @gv_carrid
       INTO TABLE @DATA(gt_results).

IF sy-subrc EQ 0.
  cl_demo_output=>display( gt_results ).
ENDIF.
