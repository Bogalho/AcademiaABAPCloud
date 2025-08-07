CLASS zcl_fabap_jul2025_exer02f_rpb DEFINITION
  ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING i_nome    TYPE string
                i_id      TYPE string
                i_salario TYPE decfloat16.

    METHODS calcular_salario
      RETURNING VALUE(r_salario) TYPE decfloat16.

    METHODS get_nome
      RETURNING VALUE(r_nome) TYPE string.

    METHODS get_id
      RETURNING VALUE(r_id) TYPE string.

    METHODS exibir_dados
      RETURNING VALUE(r_dados) TYPE string.

  PROTECTED SECTION.
    DATA gv_nome TYPE string.
    DATA gv_id TYPE string.
    DATA gv_salario_base TYPE decfloat16.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02F_RPB IMPLEMENTATION.


  METHOD calcular_salario.
    r_salario = gv_salario_base.
  ENDMETHOD.


  METHOD constructor.
    gv_nome = i_nome.
    gv_id = i_id.
    gv_salario_base = i_salario.
  ENDMETHOD.


  METHOD exibir_dados.
    r_dados = |Dados de Funcionário:Nome->{ gv_nome },ID->{ gv_id },Salario Base->{ gv_salario_base } |.
  ENDMETHOD.


  METHOD get_id.
    r_id = gv_id.
  ENDMETHOD.


  METHOD get_nome.
    r_nome = gv_nome.
  ENDMETHOD.
ENDCLASS.
