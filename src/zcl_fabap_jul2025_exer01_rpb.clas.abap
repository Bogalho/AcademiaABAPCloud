CLASS zcl_fabap_jul2025_exer01_rpb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS constructor
      IMPORTING i_codprod  TYPE string DEFAULT ''
                i_nameprod TYPE string DEFAULT ''
                i_price    TYPE decfloat16 DEFAULT ''.

    METHODS add_stock
      IMPORTING i_stock       TYPE i
      EXPORTING e_stock_total TYPE i.

    METHODS remove_stock
      IMPORTING  i_stock       TYPE i
      EXPORTING  e_stock_total TYPE i
      EXCEPTIONS ex_stock.

    METHODS calc_stock_price
      RETURNING VALUE(r_final_value) TYPE decfloat16.

    METHODS get_stock
      RETURNING VALUE(r_stock) TYPE i.

    METHODS get_codprod
      RETURNING VALUE(r_codprod) TYPE string.

    METHODS get_nameprod
      RETURNING VALUE(r_nameprod) TYPE string.

    METHODS get_price
      RETURNING VALUE(r_price) TYPE decfloat16.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA gv_codprod TYPE string.
    DATA gv_nameprod TYPE string.
    DATA gv_price TYPE decfloat16.
    DATA gv_stock TYPE i.

    DATA gv_result TYPE i.

    DATA o_prod1 TYPE REF TO zcl_fabap_jul2025_exer01_rpb.
    DATA o_prod2 TYPE REF TO zcl_fabap_jul2025_exer01_rpb.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_RPB IMPLEMENTATION.


  METHOD add_stock.
    gv_stock += i_stock.
    IF e_stock_total IS SUPPLIED.
      e_stock_total = gv_stock.
    ENDIF.
  ENDMETHOD.


  METHOD calc_stock_price.
    r_final_value = gv_price * gv_stock.
  ENDMETHOD.


  METHOD constructor.
    gv_codprod = i_codprod.
    gv_nameprod = i_nameprod.
    gv_price = i_price.
  ENDMETHOD.


  METHOD get_codprod.
    r_codprod = gv_codprod.
  ENDMETHOD.


  METHOD get_nameprod.
    r_nameprod = gv_nameprod.
  ENDMETHOD.


  METHOD get_price.
    r_price = gv_price.
  ENDMETHOD.


  METHOD get_stock.
    r_stock = gv_stock.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    o_prod1 = NEW #( i_codprod = '001'
                     i_nameprod = 'Cigarros Camel'
                     i_price = '4.40' ).

    o_prod2 = NEW #( i_codprod = '002'
                     i_nameprod = 'Sagres 25cl'
                     i_price = '0.46' ).

    out->write( |Produto 1: { o_prod1->get_codprod(  ) }/{ o_prod1->get_nameprod(  ) }/{ o_prod1->get_price(  ) }EUR/{ o_prod1->get_stock(  ) }| ).
    out->write( |Produto 2: { o_prod2->get_codprod(  ) }/{ o_prod2->get_nameprod(  ) }/{ o_prod2->get_price(  ) }EUR/{ o_prod2->get_stock(  ) }| ).

    out->write( |Adicionar 10 de quantidade ao produto 1| ).
    o_prod1->add_stock( 10 ).
    out->write( |Calcular valor do produto 1| ).
    out->write( |Valor Total do produto { o_prod1->get_codprod(  ) }:{ o_prod1->calc_stock_price( ) }EUR| ).
    out->write( |Remover 5 de quantidade do produto 1| ).
    o_prod1->remove_stock(
    EXPORTING
        i_stock = 5
    IMPORTING
        e_stock_total = gv_result ).
    IF gv_result >= 0.
        out->write( |Calcular valor do produto 1| ).
        out->write( |Valor Total do produto { o_prod1->get_codprod(  ) }:{ o_prod1->calc_stock_price( ) }EUR| ).
    ELSE.
        out->write( |Não pode remover 5 de stock do produto - { o_prod1->get_nameprod(  ) }!| ).
    ENDIF.
    out->write( |Remover 10 de quantidade do produto 1| ).
    o_prod1->remove_stock(
    EXPORTING
        i_stock = 10
    IMPORTING
        e_stock_total = gv_result ).
    IF gv_result >= 0.
        out->write( |Calcular valor do produto 1| ).
        out->write( |Valor Total do produto { o_prod1->get_codprod(  ) }:{ o_prod1->calc_stock_price( ) }EUR| ).
    ELSE.
        out->write( |Não pode remover 10 de stock do produto - { o_prod1->get_nameprod(  ) }!| ).
    ENDIF.
  ENDMETHOD.


  METHOD remove_stock.
    IF gv_stock < i_stock.
      e_stock_total = -1.
      "Não pode remover & de stock do produto - &!
      MESSAGE s001(zfabap_jul2025_rpb) WITH i_stock
                                            gv_nameprod
      DISPLAY LIKE 'E'
      RAISING ex_stock.
    ELSE.
      gv_stock -= i_stock.
      IF e_stock_total IS SUPPLIED.
        e_stock_total = gv_stock.
      ENDIF.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
