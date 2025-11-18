@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Book Interface View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZVJY_RAP_01_I_BOOK as select from Zvjy_rap_01_book
{
  key book_id as BookId,
      book_name as BookName,
      book_author as BookAuthor,
      book_pub_date as BookPubDate
}
