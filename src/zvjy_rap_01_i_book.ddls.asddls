@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Book Interface View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZVJY_RAP_01_I_BOOK
  as select from Zvjy_rap_01_book
{

      @EndUserText.label: 'Book ID'
  key book_id       as BookId,
      @EndUserText.label: 'Book Name'
      book_name     as BookName,
      @EndUserText.label: 'Book Author'
      book_author   as BookAuthor,
      @EndUserText.label: 'Book PubDate'
      book_pub_date as BookPubDate
}
