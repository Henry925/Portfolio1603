CLASS zcl_123456_travel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_123456_travel IMPLEMENTATION.

METHOD if_oo_adt_classrun~main.
  DATA travels TYPE TABLE OF ZC_123456_TravelWithAgency.
    data reiseagenturnummer type string.

    "Einen Datensatz selektieren und ausgeben

    SELECT FROM ZC_123456_TravelWithAgency
     FIELDS *
     WHERE AgencyID = @reiseagenturnummer

     "order by TravelID asc, Description desc

     INTO TABLE @travels.

    IF sy-subrc <> 0.
      out->write( |No Travels found for  | ).
      RETURN.
    ENDIF.
    LOOP AT travels INTO DATA(travel).
     out->write( |{ travel-travelid } { travel-AgencyID }| ).
    ENDLOOP.


    ENDMETHOD.
ENDCLASS.
