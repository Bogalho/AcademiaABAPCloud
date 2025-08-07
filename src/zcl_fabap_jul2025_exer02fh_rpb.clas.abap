CLASS zcl_fabap_jul2025_exer02fh_rpb DEFINITION
  INHERITING FROM zcl_fabap_jul2025_exer02f_rpb
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS calcular_salario REDEFINITION.

    METHODS constructor
      IMPORTING i_nome    TYPE string
                i_id      TYPE string
                i_salario TYPE decfloat16
                i_horas   TYPE i.

    METHODS exibir_dados REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA gv_horas TYPE i.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02FH_RPB IMPLEMENTATION.


  METHOD calcular_salario.
    r_salario = super->calcular_salario(  ) * gv_horas.
  ENDMETHOD.


  METHOD constructor.

    super->constructor( i_nome = i_nome
                        i_id = i_id
                        i_salario = i_salario ).
    gv_horas = i_horas.

  ENDMETHOD.


  METHOD exibir_dados.
    r_dados = |Dados de Funcionário Horista:Nome->{ gv_nome },ID->{ gv_id },Salario Base->{ gv_salario_base } |.
  ENDMETHOD.
ENDCLASS.
