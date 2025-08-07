CLASS zcl_fabap_jul2025_exer02ex_rpb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA gv_funcionario1 TYPE REF TO zcl_fabap_jul2025_exer02fh_rpb.
    DATA gv_funcionario2 TYPE REF TO zcl_fabap_jul2025_exer02fi_rpb.


ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02EX_RPB IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    gv_funcionario1 = NEW #( i_nome = 'Hugo Santos'
                              i_id = '001'
                              i_salario = '500'
                              i_horas = 10  ).

    gv_funcionario2 = NEW #( i_nome = 'Gonçalo Santos'
                              i_id = '002'
                              i_salario = '1000'
                              i_bonus = 600  ).

    out->write( |{ gv_funcionario1->exibir_dados(  ) }| ).
    out->write( |Salario do funcionario { gv_funcionario1->get_nome(  ) }:{ gv_funcionario1->calcular_salario(  ) } | ).

    out->write( |{ gv_funcionario2->exibir_dados(  ) }| ).
    out->write( |Salario do funcionario { gv_funcionario2->get_nome(  ) }:{ gv_funcionario2->calcular_salario(  ) } | ).
  ENDMETHOD.
ENDCLASS.
