CLASS zcl_fabap_jul2025_exer17_rpb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer17_rpb IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    SELECT b~carrier_id, b~connection_id, b~flight_date
*    FROM /dmo/booking AS b
*    INNER JOIN /dmo/flight AS f ON b~carrier_id = f~carrier_id
*                                                       AND b~connection_id = f~connection_id
*    WHERE f~carrier_id = 'UA'
*                                                       INTO TABLE @DATA(lt_bookings).
*
*    LOOP AT lt_bookings INTO DATA(ls_booking).
*      out->write( |Voo { ls_booking-carrier_id } { ls_booking-connection_id }: { ls_booking-flight_date }| ).
*    ENDLOOP.

    SELECT carrier_id, connection_id FROM /dmo/flight WHERE carrier_id = 'UA' INTO TABLE @DATA(lt_flights).

    SELECT carrier_id, connection_id, flight_date FROM /dmo/booking
      FOR ALL ENTRIES IN @lt_flights
      WHERE carrier_id    = @lt_flights-carrier_id
        AND connection_id = @lt_flights-connection_id
      INTO TABLE @DATA(lt_bookings).

    SORT lt_bookings BY carrier_id connection_id.

    LOOP AT lt_flights INTO DATA(ls_fligth).

      READ TABLE lt_bookings WITH KEY carrier_id = ls_fligth-carrier_id
                                      connection_id = ls_fligth-connection_id
         BINARY SEARCH TRANSPORTING NO FIELDS.
      CHECK sy-subrc = 0.
      DATA(lv_tabix) = sy-tabix.

      LOOP AT lt_bookings FROM lv_tabix INTO DATA(ls_booking).
        out->write( |Voo { ls_booking-carrier_id } { ls_booking-connection_id }: { ls_booking-flight_date }| ).
      ENDLOOP.

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
