@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Book Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity  ZC_VJY_RAP_01_BOOK 
provider contract   transactional_query
as projection on ZVJY_RAP_01_I_BOOK
{
         @EndUserText.label: 'Book ID'
    key BookId,
          @EndUserText.label: 'Book Name'
    BookName,
          @EndUserText.label: 'Book Author'
    BookAuthor,
          @EndUserText.label: 'Book Publication Date'
    BookPubDate
}
