CLASS zcl_eml_demo_how DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_eml_demo_how IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Simple read
*    READ ENTITIES OF ZI_RAP_Travel_How
*      ENTITY Travel
*        FROM VALUE #( ( TravelUUID = 'FBB809C0396F8F811800A812B4411CB1' ) )
*        RESULT DATA(travel_data).

*    out->write( travel_data ).

    "Read with fields
*    READ ENTITIES OF ZI_RAP_Travel_How
*      ENTITY Travel
*        FIELDS ( TravelID
*                 AgencyID
*                 CustomerID )
*        WITH VALUE #( ( TravelUUID = 'FBB809C0396F8F811800A812B4411CB1' ) )
*        RESULT DATA(travel_data).

*    out->write( travel_data ).

    "Read all fields
*    READ ENTITIES OF ZI_RAP_Travel_How
*      ENTITY Travel
*        ALL FIELDS
*        WITH VALUE #( ( TravelUUID = 'FBB809C0396F8F811800A812B4411CB1' ) )
*        RESULT DATA(travel_data).
*
*    out->write( travel_data ).

    "Read by Association
*    READ ENTITIES OF ZI_RAP_Travel_How
*      ENTITY Travel BY \_Booking
*        ALL FIELDS
*        WITH VALUE #( ( TravelUUID = 'FBB809C0396F8F811800A812B4411CB1' ) )
*        RESULT DATA(booking_data).
*
*    out->write( booking_data ).

    "Unsuccessful Read
*    READ ENTITIES OF ZI_RAP_Travel_How
*      ENTITY Travel
*        ALL FIELDS
*        WITH VALUE #( ( TravelUUID = '111111111111111111111111111111111' ) ) "Does not exist
*        RESULT DATA(travel_data)
*        REPORTED DATA(reported_data)
*        FAILED DATA(failed_data).
*
*    out->write( travel_data ).
*    out->write( reported_data ). "Confirm this data via Debug since Log not yet supported due to deep/complex structure
*    out->write( failed_data ). "Confirm this data via Debug since Log not yet supported due to deep/complex structure

    "Modify Update
*    MODIFY ENTITIES OF ZI_RAP_Travel_How
*      ENTITY Travel
*        UPDATE
*          SET FIELDS WITH VALUE #( ( TravelUUID = 'FBB809C0396F8F811800A812B4411CB1'
*                                     Description = 'Updated via EML Modify(How)' ) )
*        FAILED DATA(failed_data)
*        REPORTED DATA(reported_data).
*
*    IF failed_data IS INITIAL.
*
*      COMMIT ENTITIES
*        RESPONSE OF ZI_RAP_Travel_How
*        REPORTED DATA(reported_commit)
*        FAILED DATA(failed_commit).
*
*      IF failed_commit IS INITIAL.
*        out->write( 'Updated successfully!' ).
*      ENDIF.
*    ENDIF.

    "Modify Create
*    MODIFY ENTITIES OF ZI_RAP_Travel_How
*      ENTITY Travel
*        CREATE
*          SET FIELDS WITH VALUE
*          #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'Created via EML Modify(How)' ) )
*
*        MAPPED DATA(mapped_data)
*        FAILED DATA(failed_data)
*        REPORTED DATA(reported_data).
*
*    IF failed_data IS INITIAL.
*
*      out->write( mapped_data-travel ).
*
*      COMMIT ENTITIES
*        RESPONSE OF ZI_RAP_Travel_How
*        REPORTED DATA(reported_commit)
*        FAILED DATA(failed_commit).
*
*      IF failed_commit IS INITIAL.
*        out->write( |Created TravelUUID: { mapped_data-travel[ 1 ]-TravelUUID } successfully!| ).
*      ENDIF.
*    ENDIF.

    "Modify Delete
    MODIFY ENTITIES OF ZI_RAP_Travel_How
       ENTITY Travel
         DELETE FROM VALUE
           #( ( TravelUUID = '36805EA470A71EEDBEBC5A2FC8858FD6' ) )

         FAILED DATA(failed_data)
         REPORTED DATA(reported_data).

    IF failed_data IS INITIAL.

      COMMIT ENTITIES
        RESPONSE OF ZI_RAP_Travel_How
        REPORTED DATA(reported_commit)
        FAILED DATA(failed_commit).

      IF failed_commit IS INITIAL.
        out->write( |Deleted successfully!| ).
      ENDIF.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
