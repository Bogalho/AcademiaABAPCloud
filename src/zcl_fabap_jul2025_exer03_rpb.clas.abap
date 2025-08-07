CLASS zcl_fabap_jul2025_exer03_rpb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.



ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER03_RPB IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA o_produto TYPE REF TO lcl_produto.
    DATA o_prod2 TYPE REF TO lcl_produto.
    DATA o_prod3 TYPE REF TO lcl_produto.

    o_produto = lcl_produto=>get_instance( i_codprod = '001'
                                           i_nameprod = 'Pastilhas Gorilla'
                                           i_price = '0.50').

    out->write( |Produto: { o_produto->get_codprod(  ) }/{ o_produto->get_nameprod(  ) }/{ o_produto->get_price(  ) }EUR/{ o_produto->get_stock(  ) }| ).

  ENDMETHOD.
ENDCLASS.
