CLASS zcl_fabap_jul2025_exer15_rpb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer15_rpb IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT f~carrier_id, f~connection_id, f~price, c~distance
    FROM /dmo/flight AS f
    INNER JOIN /dmo/connection AS c ON f~carrier_id = c~carrier_id
                                                       AND f~connection_id = c~connection_id
    WHERE c~distance > 1000 AND f~carrier_id = 'UA'
                                                       INTO TABLE @DATA(lt_flights).

    TYPES: BEGIN OF ty_flights,
             carrier_id    TYPE /dmo/carrier_id,
             connection_id TYPE /dmo/connection_id,
             price         TYPE /dmo/flight_price,
             distance      TYPE /dmo/flight_distance,
           END OF ty_flights.

    DATA lt_flights2 TYPE TABLE OF ty_flights.
    lt_flights2 = VALUE #(
        FOR flight IN lt_flights
            ( carrier_id    = flight-carrier_id
              connection_id = flight-connection_id
              price         = COND #(
                                WHEN flight-distance > 1000 THEN flight-price * '1.10'
                                ELSE flight-price )
              distance      = flight-distance ) ).


    LOOP AT lt_flights2 INTO DATA(ls_flights).
      out->write( |Preço atualizado para voo { ls_flights-carrier_id }-{ ls_flights-connection_id } | ).
    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
