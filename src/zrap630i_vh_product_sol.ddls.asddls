@ObjectModel.query.implementedBy: 'ABAP:ZRAP630_CL_VH_PRODUCT_SOL'
@EndUserText.label: 'Value help for products'
define custom entity ZRAP630I_VH_Product_SOL
{
  key Product : abap.char( 40 );
  ProductText : abap.char( 40 );
  ProductGroup : abap.char( 40 );
  @Semantics.amount.currencyCode: 'Currency'
  Price : abap.curr( 15, 2 );
  Currency : abap.cuky( 5 );
  BaseUnit : abap.unit( 3 );
  
}
