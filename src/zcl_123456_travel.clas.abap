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
    data reiseagenturnummer type c LENGTH 6 value 170331.



    "Einen Datensatz selektieren und ausgeben

    SELECT FROM ZC_123456_TravelWithAgency
     FIELDS *
     WHERE AgencyID = @reiseagenturnummer
     INTO TABLE @travels.
    IF sy-subrc <> 0.
      out->write( |No Travels found for: { reiseagenturnummer }| ).
      RETURN.
    ENDIF.



    "Löschen der Email-Adresse bei allen Einträgen
     DELETE travels WHERE AgencyEmailAddress IS INITIAL.

     "Löschen aller Einträge mit Status P und N
    DELETE travels WHERE Status = 'P' or Status = 'N' .

     "Sortieren der Einträge nach Reisenummer asc, Beschreibung desc
    SORT travels BY TravelID DESCENDING Description ASCENDING.


    TRY.
       travel2 = travels[ 0 ]. "...Index
      CATCH cx_sy_itab_line_not_found INTO DATA(x).

         out->write( |Agency Id: { travel2-AgencyId }| ).
         out->write( |Agency Name: { travel2-AgencyName }| ).
       out->write( |Agency Adress: { travel2-AgencyAddress }| ).
    ENDTRY.

  DATA travel_agency TYPE ZC_123456_TravelWithAgency.





    LOOP AT travels INTO DATA(travel).
      out->write( |{ travel-TravelId }, { travel-Duration }, { travel-Price }, { travel-Description } | ).
    ENDLOOP.



    ENDMETHOD.
ENDCLASS.
