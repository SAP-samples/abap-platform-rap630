class ZRAP630_CL_VH_PRODUCT_SOL definition
  public
  final
  create public .

public section.

  interfaces IF_RAP_QUERY_PROVIDER .

  types:
    T_PRODUCTS TYPE STANDARD TABLE OF ZRAP630I_VH_PRODUCT_SOL WITH  EMPTY KEY .

  data:
    PRODUCTY TYPE t_products READ-ONLY .

  methods GET_PRODUCTS
    returning
      value(PRODUCTS) type t_products .
protected section.
private section.
ENDCLASS.



CLASS ZRAP630_CL_VH_PRODUCT_SOL IMPLEMENTATION.


METHOD GET_PRODUCTS.
"
  products = VALUE #(
  ( Product = 'ZPRINTER01' ProductText = 'Printer Professional ABC' Price = '500.00 ' Currency = 'EUR' ProductGroup = 'L001' BaseUnit = 'ST'  )
  ( Product = 'ZPRINTER02' ProductText = 'Printer Platinum' Price = '800.00 ' Currency = 'EUR' ProductGroup = 'L001' BaseUnit = 'ST'  )
  ( Product = 'D001' ProductText = 'Mobile Phone' Price = '850.00 ' Currency = 'EUR' ProductGroup = 'L001' BaseUnit = 'ST'  )
  ( Product = 'D002' ProductText = 'Table PC' Price = '900.00 ' Currency = 'EUR' ProductGroup = 'L001' BaseUnit = 'ST'  )
  ( Product = 'D003' ProductText = 'Office Table' Price = '599.00 ' Currency = 'EUR' ProductGroup = 'L001' BaseUnit = 'ST'  )
  ( Product = 'D004' ProductText = 'Office Chair' Price = '449.00 ' Currency = 'EUR' ProductGroup = 'L001' BaseUnit = 'ST'  )
  ( Product = 'D005' ProductText = 'Developer Notebook' Price = '3150.00 ' Currency = 'EUR' ProductGroup = 'L001' BaseUnit = 'ST'  )
  ( Product = 'D006' ProductText = 'Mouse' Price = '79.00 ' Currency = 'EUR' ProductGroup = 'L001' BaseUnit = 'ST'  )
  ( Product = 'D007' ProductText = 'Headset' Price = '159.00 ' Currency = 'EUR' ProductGroup = 'L001' BaseUnit = 'ST'  )
  ( Product = 'D008' ProductText = 'Keyboard' Price = '39.00 ' Currency = 'EUR' ProductGroup = 'L001' BaseUnit = 'ST'  )
   ).
ENDMETHOD.


METHOD IF_RAP_QUERY_PROVIDER~SELECT.
  DATA business_data TYPE TABLE OF ZRAP630I_VH_Product_SOL.
  DATA business_data_line TYPE ZRAP630I_VH_Product_SOL .
  DATA(skip)    = io_request->get_paging( )->get_offset( ).
  DATA(requested_fields)  = io_request->get_requested_elements( ).
  DATA(sort_order)    = io_request->get_sort_elements( ).
  TRY.
    DATA(filter_condition) = io_request->get_filter( )->get_as_sql_string( ).
    business_data = get_products(  ).
    SELECT * FROM @business_data AS implementation_types
       WHERE (filter_condition) INTO TABLE @business_data.
    io_response->set_total_number_of_records( lines( business_data ) ).
    io_response->set_data( business_data ).
    CATCH cx_root INTO DATA(exception).
    DATA(exception_message) = cl_message_helper=>get_latest_t100_exception( exception )->if_message~get_longtext( ).
    DATA(exception_t100_key) = cl_message_helper=>get_latest_t100_exception( exception )->t100key.
    RAISE EXCEPTION TYPE zdmo_cx_rap_gen_custom_entity
        EXPORTING
          textid   = VALUE scx_t100key( msgid = exception_t100_key-msgid
          msgno = exception_t100_key-msgno
          attr1 = exception_t100_key-attr1
          attr2 = exception_t100_key-attr2
          attr3 = exception_t100_key-attr3
          attr4 = exception_t100_key-attr4 )
    previous = exception.
  ENDTRY.

ENDMETHOD.
ENDCLASS.
