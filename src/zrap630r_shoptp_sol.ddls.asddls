@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'CDS View forShop'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ '_Extension' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define root view entity ZRAP630R_ShopTP_SOL
  as select from ZRAP630_ASHOPSOL as Shop
  association [1] to ZRAP630E_Shop_SOL as _Extension on $projection.OrderUUID = _Extension.OrderUUID
{
  key ORDER_UUID as OrderUUID,
  ORDER_ID as OrderID,
  ORDERED_ITEM as OrderedItem,
  CURRENCY_CODE as CurrencyCode,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  ORDER_ITEM_PRICE as OrderItemPrice,
  DELIVERY_DATE as DeliveryDate,
  OVERALL_STATUS as OverallStatus,
  NOTES as Notes,
  @Semantics.systemDateTime.lastChangedAt: true
  LAST_CHANGED_AT as LastChangedAt,
  @Semantics.user.createdBy: true
  CREATED_BY as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  CREATED_AT as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  LOCAL_LAST_CHANGED_BY as LocalLastChangedBy,
  @Semantics.user.lastChangedBy: true
  LAST_CHANGED_BY as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  LOCAL_LAST_CHANGED_AT as LocalLastChangedAt,
  _Extension
  
}
