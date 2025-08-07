CLASS zcl_fabap_jul2025_exer13_rpb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer13_rpb IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA(lv_carrid) = 'AA'.
    out->write( |New Version - Carrier ID: { lv_carrid }| ).

    TYPES: BEGIN OF ty_flight_new,
             carrid      TYPE /dmo/carrier_id,
             connid      TYPE /dmo/connection_id,
             flight_date TYPE /dmo/flight_date,
           END OF ty_flight_new.
    DATA lt_flights_new TYPE STANDARD TABLE OF ty_flight_new WITH EMPTY KEY.

    DATA(ls_flight_new) = VALUE ty_flight_new(
                                    carrid = 'LH'
                                    connid = '0400'
                                    flight_date = '20250725' ).
    APPEND ls_flight_new TO  lt_flights_new.

    out->write( |New Version - Flight: { ls_flight_new-carrid }-{ ls_flight_new-connid }| ).


    SELECT FROM /dmo/flight
    FIELDS *
    INTO TABLE @DATA(lt_flights_select_old)
    UP TO 2 ROWS.
    out->write( |New Version - Flights found (SELECT): { lines( lt_flights_select_old ) }| ).

    DATA(ls_row) = lt_flights_new[ 1 ].

    out->write( |New Version - First Flight: { ls_row-carrid } { ls_row-connid } { ls_row-flight_date }| ).

    DATA(ls_flight_key_new) = lt_flights_new[ carrid = 'LH' connid = '0400' ].

    out->write( |New Version - Flight LH-0400: { ls_row-carrid }-{ ls_row-connid }| ).

    DATA(lv_char_new) = '12345'.
    DATA(lv_int_new) = CONV i( lv_char_new ).
    DATA(lv_char_conv) = CONV ty_char10( lv_int_new ).

    out->write( |New Version - Converted to INT: { lv_char_conv } | ).

    DATA(ls_connection_new) = VALUE /dmo/connection( ).
    ls_connection_new-airport_from_id = 'FRA'.
    ls_connection_new-airport_to_id = 'JFK'.

    out->write( |Old Version - Connection: { ls_connection_new-airport_from_id }-{ ls_connection_new-airport_to_id }| ).

  ENDMETHOD.

ENDCLASS.
