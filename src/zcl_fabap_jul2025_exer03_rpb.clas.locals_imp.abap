*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_produto DEFINITION FINAL.

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING i_codprod  TYPE string
                i_nameprod TYPE string
                i_price    TYPE decfloat16.

    CLASS-METHODS get_instance
      IMPORTING i_codprod         TYPE string
                i_nameprod        TYPE string
                i_price           TYPE decfloat16
      RETURNING VALUE(ro_produto) TYPE REF TO lcl_produto.

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


ENDCLASS.

CLASS lcl_produto IMPLEMENTATION.

  METHOD constructor.
    gv_codprod = i_codprod.
    gv_nameprod = i_nameprod.
    gv_price = i_price.
  ENDMETHOD.

  METHOD get_instance.
    ro_produto = NEW #( i_codprod = i_codprod
                        i_nameprod = i_nameprod
                        i_price = i_price ).
  ENDMETHOD.

  METHOD add_stock.
    gv_stock += i_stock.
    IF e_stock_total IS SUPPLIED.
      e_stock_total = gv_stock.
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

  METHOD calc_stock_price.
    r_final_value = gv_price * gv_stock.
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

ENDCLASS.
