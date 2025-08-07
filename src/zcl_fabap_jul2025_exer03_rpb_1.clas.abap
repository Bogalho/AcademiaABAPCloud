CLASS zcl_fabap_jul2025_exer03_rpb_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA t_table1 TYPE TABLE OF zi_fabap_exer01_rpb.
    DATA t_table2 TYPE TABLE OF zi_fabap_exer02_rpb.
    DATA t_table3 TYPE STANDARD TABLE OF zi_fabap_exer03_rpb.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER03_RPB_1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT *
    FROM zi_fabap_exer01_rpb
    INTO TABLE @t_table1.
    out->write( t_table1 ).

    SELECT *
    FROM zi_fabap_exer02_rpb
    INTO TABLE @t_table2.
    out->write( t_table2 ).

    SELECT *
    FROM zi_fabap_exer03_rpb
    INTO TABLE @t_table3.
    out->write( t_table3 ).

  ENDMETHOD.
ENDCLASS.
