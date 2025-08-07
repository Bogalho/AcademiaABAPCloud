CLASS zcl_fabap_jul2025_exer04_rpb_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA v_ampd TYPE STANDARD TABLE OF zi_fabap_demo01_eat WITH EMPTY KEY.


ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER04_RPB_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
   zcl_fabap_jul2025_exer04_rpb=>get_data( IMPORTING et_data = v_ampd ).

   out->write( v_ampd ).
  ENDMETHOD.
ENDCLASS.
