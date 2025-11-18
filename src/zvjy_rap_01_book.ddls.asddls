@ClientHandling.type: #CLIENT_DEPENDENT
@AbapCatalog.deliveryClass: #APPLICATION_DATA
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Book Details'
define table entity Zvjy_rap_01_book
{
  key book_id : abap.char( 10 );
      book_name     : abap.char( 30 ) ;
      book_author   : abap.char(30);
      book_pub_date : abap.datn;   
}
