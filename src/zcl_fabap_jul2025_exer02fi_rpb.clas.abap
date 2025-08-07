CLASS zcl_fabap_jul2025_exer02fi_rpb DEFINITION
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
                i_bonus   TYPE i.

    METHODS exibir_dados REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA gv_bonus TYPE i.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02FI_RPB IMPLEMENTATION.


  METHOD calcular_salario.
    r_salario = super->calcular_salario(  ) + gv_bonus.
  ENDMETHOD.


  METHOD constructor.

    super->constructor( i_nome = i_nome
                        i_id = i_id
                        i_salario = i_salario ).
    gv_bonus = i_bonus.

  ENDMETHOD.


  METHOD exibir_dados.
    r_dados = |Dados de Funcionário Integral:Nome->{ gv_nome },ID->{ gv_id },Salario Base->{ gv_salario_base } |.
  ENDMETHOD.
ENDCLASS.
