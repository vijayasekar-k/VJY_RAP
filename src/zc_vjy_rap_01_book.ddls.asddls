@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Book Projection View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity  ZC_VJY_RAP_01_BOOK 
provider contract   transactional_query
as projection on ZVJY_RAP_01_I_BOOK
{
    key BookId,
    BookName,
    BookAuthor,
    BookPubDate
}
