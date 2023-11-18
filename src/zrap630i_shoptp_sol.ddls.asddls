@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Projection View forShop'
@AbapCatalog.extensibility: {
  extensible: true, 
  elementSuffix: 'ZAA', 
  allowNewDatasources: false, 
  allowNewCompositions: true, 
  dataSources: [ 'Shop' ], 
  quota: {
    maximumFields: 100 , 
    maximumBytes: 10000 
  }
}
define root view entity ZRAP630I_ShopTP_SOL
  provider contract transactional_interface
  as projection on ZRAP630R_ShopTP_SOL as Shop
{
  key OrderUUID,
  OrderID,
  OrderedItem,
  CurrencyCode,
  OrderItemPrice,
  DeliveryDate,
  OverallStatus,
  Notes,
  LastChangedAt,
  CreatedBy,
  CreatedAt,
  LocalLastChangedBy,
  LastChangedBy,
  LocalLastChangedAt
  
}
