*&---------------------------------------------------------------------*
*& Report z14_mde_test_hrg
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z14_mde_test_hrg.

cl_dd_ddl_annotation_service=>get_annos(
  EXPORTING
    entityname         = 'zb_15_airl_m_hrg'
  IMPORTING
    element_annos      = DATA(gt_element_annos) ).

cl_dd_ddl_annotation_service=>get_annos_4_element(
  EXPORTING
    entityname         = 'ZB_16_AIRL_M_HRG'
    elementname        = 'Airline'
  IMPORTING
    annos              = DATA(gt_annos_element)
).

cl_demo_output=>display( gt_annos_element ).
