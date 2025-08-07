CLASS zcl_fabap_jul2025_demo01_rpb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_DEMO01_RPB IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
     if '1' = '1'.
       out->write( |Hello World!| ).
     endif.
  ENDMETHOD.
ENDCLASS.
