CLASS lhc_ZVJY_RAP_01_I_BOOK DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zvjy_rap_01_i_book RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zvjy_rap_01_i_book.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zvjy_rap_01_i_book.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zvjy_rap_01_i_book.

    METHODS read FOR READ
      IMPORTING keys FOR READ zvjy_rap_01_i_book RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zvjy_rap_01_i_book.

ENDCLASS.

CLASS lhc_ZVJY_RAP_01_I_BOOK IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.
   DATA: lt_books TYPE TABLE OF zvjy_rap_01_book.

    " Map entities to database structure
    lt_books = VALUE #( FOR entity IN entities (
*      book_id = entity-BookId
*      book_name = entity-BookName
*      book_author = entity-BookAuthor
*      book_pub_date = entity-BookPubDate
            book_id = '1'
      book_name = 'ABCD'
      book_author = 'AAAA'
*      book_pub_date = entity-BookPubDate
    ) ).

    " Insert into database
    INSERT zvjy_rap_01_book FROM TABLE @lt_books.

*    " Handle response
*    READ ENTITIES OF zvjy_rap_01_I_book IN LOCAL MODE
*      ENTITY zvjy_rap_01_I_book
*      ALL FIELDS WITH CORRESPONDING #( entities )
*      RESULT DATA(lt_result).
*
*    result = VALUE #( FOR book IN lt_result (
*      %cid = entities[ book_id = book-BookId ]-%cid
*      %key = book-%key)).

  ENDMETHOD.

  METHOD update.
      " Implement update logic
    DATA: lt_books TYPE TABLE OF zvjy_rap_01_book,
           ls_book TYPE zvjy_rap_01_book.

    " Read current data
    SELECT * FROM zvjy_rap_01_book
      FOR ALL ENTRIES IN @entities
      WHERE book_id = @entities-BookId
      INTO TABLE @lt_books.

    " Update fields
    LOOP AT entities INTO DATA(entity).
      READ TABLE lt_books assigning FIELD-SYMBOL(<ls_book>)
        WITH KEY book_id = entity-BookId.
      IF sy-subrc = 0.
        IF entity-%control-BookName = if_abap_behv=>mk-on.
          <ls_book>-book_name = entity-BookName.
        ENDIF.
        IF entity-%control-BookAuthor = if_abap_behv=>mk-on.
          <ls_book>-book_author = entity-BookAuthor.
        ENDIF.
        IF entity-%control-BookPubDate = if_abap_behv=>mk-on.
          <ls_book>-book_pub_date = entity-BookPubDate.
        ENDIF.
      ENDIF.

    ENDLOOP.

    " Update database
    UPDATE zvjy_rap_01_book FROM table @lt_books.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
      " Read data from database
    SELECT * FROM zvjy_rap_01_book
      FOR ALL ENTRIES IN @keys
      WHERE book_id = @keys-BookId
      INTO TABLE @DATA(lt_books).

    result = VALUE #( FOR book IN lt_books (
      %key-BookId = book-book_id
      BookId = book-book_id
      BookName = book-book_name
      BookAuthor = book-book_author
      BookPubDate = book-book_pub_date
    ) ).

  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZVJY_RAP_01_I_BOOK DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZVJY_RAP_01_I_BOOK IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
