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
  Data travel2 type ZC_123456_TravelWithAgency.
    data reiseagenturnummer type c LENGTH 6 value '070050'.



    "Einen Datensatz selektieren und ausgeben

    SELECT FROM ZC_123456_TravelWithAgency
     FIELDS *
     WHERE AgencyID = @reiseagenturnummer
     INTO TABLE @travels.
    IF sy-subrc <> 0.
      out->write( |No Travels found for: { reiseagenturnummer }| ).
      RETURN.
    ENDIF.




    DELETE travels WHERE Status = 'P' or Status = 'N' .

       SORT travels BY TravelID DESCENDING Description ASCENDING.


      SELECT SINGLE FROM ZC_123456_TravelWithAgency
     FIELDS *
     WHERE AgencyID = @reiseagenturnummer
     INTO @travel2.
    IF sy-subrc <> 0.
      out->write( |No Travels found for: { reiseagenturnummer }| ).
    ENDIF.

  DATA travel_agency TYPE ZC_123456_TravelWithAgency.


      out->write( |Agency Id: { travel2-AgencyId }| ).
      out->write( |Agency Name: { travel2-AgencyName }| ).
      out->write( |Agency Adress: { travel2-AgencyAddress }| ).
     out->write( '-' ) .
    out->write( 'TravelId, Duration, Price, Description' ) .

    LOOP AT travels INTO DATA(travel).
      out->write( |{ travel-TravelId }, { travel-Duration }, { travel-Price }, { travel-Description } | ).
    ENDLOOP.


    ENDMETHOD.
ENDCLASS.
