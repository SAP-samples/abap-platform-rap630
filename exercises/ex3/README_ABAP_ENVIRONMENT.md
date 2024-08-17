[Home - Cloud ERP Extensibility](../../../../#exercises)  

# Exercise 3 - Extend the CDS data model using the field extension wizard 

In the preceeding exercise we have extended the _behavior_ of the based RAP BO by adding a determination, a validation and a side effect. 

We will now adapt the _CDS data model_, that means we will add new fields to the _Shop_ entity. 

Compared to the activities for adding additional behavior this is a larger amount of work since the complete stack of CDS views has be extended rather than only extensing the behavior definition (BDEF).

![Overview](images/ex3_01_overview_RAP630.png)


## Exercise 3.1 - Check (and adapt) the CDS data model (of the extensible base RAP BO)

In order to extend the data model of a RAP BO the base RAP BO must be enabled to support extensibility as described in the Online Help.  
[RAP Extensibility-Enablement](https://help.sap.com/docs/abap-cloud/abap-rap/rap-extensibility-enablement)

For your convenience we have generated such an extensible RAP BO `ZRAP630R_ShopTP_###` for you.

![Overview](images/ex3_02_040_show_objects_to_be_extended.png)  


## Excercise 3.2 - Extend the data structure with the extension field wizard


1. right click on the C-TP view (the one with the statement `provider contract TRANSACTIONAL_QUERY` )  
   and choose **Generate ABAP Repository Objects ..**.

2. In Select Generator screen choose **ABAP Cloud: Extensibility** and then **Extension Fields**. Press **Next**.

3. In Enter Package enter the name `ZRAP630_###_EXT`

Press **Add**

In **Add Field** dialogue enter the following values to add a field to enter feedback

4. Name `ZZFEEDBACKZAA`
5. Label: `Feedback`
6. Data Elemeent: `TEXT100`
7. Activate check box **Generate UI annotations**

8. Press **Add**

Check the **Business Service Layer Extensions** taht **Extend Object** is checked.

Press **Next**

The wizard now shows the list of ABAP Artifacts that are going to be created / modified.

Checkout the code for all artifacts

120

```abap
@EndUserText.label : 'ZAPD_ZRAP630SSHOP_05A'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
extend type zrap630sshop_05a with zapd_zrap630sshop_05a {

  zzfeedbackzaa : text100;

}
```

130

```abap
extend view entity ZRAP630E_SHOP_05A with 
{
  SHOP.ZZFEEDBACKZAA as ZZFEEDBACKZAA

}
```     

140

```abap
extend view entity ZRAP630R_SHOPTP_05A with 
{
  @EndUserText.label: 'Feedback'
  _EXTENSION.ZZFEEDBACKZAA as ZZFEEDBACKZAA

}
```

150
```ABAP
extend view entity ZRAP630R_SHOP_D_05A with 
{
  SHOP.ZZFEEDBACKZAA as ZZFEEDBACKZAA

}
```


160

```abap
extend view entity ZRAP630I_SHOPTP_05A with 
{
  @EndUserText.label: 'Feedback'
  SHOP.ZZFEEDBACKZAA as ZZFEEDBACKZAA

}
```

170

here UI annotations have been added

```abap
extend view entity ZRAP630C_SHOPTP_05A with 
{
  @EndUserText.label: 'Feedback'
  @UI.dataFieldDefault: [{hidden: false}]
  @UI.identification: [{hidden: false}]
  @UI.lineItem: [{hidden: false}]
  SHOP.ZZFEEDBACKZAA as ZZFEEDBACKZAA

}
```

Press  **Next** to continue

Select a transport request





## Excercise 3.2 - Extend the data structure

As shown in the schematic view above we have to extend the following objects of our extensible base BO.
  
Order of extension | Repository object name | Name           | Comment  
-------- | ------------------------- | ------------------------ | -----------------------------------------------------   
1        | `ZAPD_ZRAP630SSHOP_###`   | Extension include        | extends active and draft table with additional fields    
2        | `ZX_ZRAP630E_SHOP_###`    | Extension include view   | selects from (extended) active table   
3        | `ZX_ZRAP630R_SHOPTP_###`  | Restricted base view     | selects from (2)   
4        | `ZX_ZRAP630C_SHOPTP_###`  | CDS projection view      | selects from (3)   
5        | `ZX_ZRAP630I_SHOPTP_###`  | Interface view           | selects from (3)   
6        | `ZX_ZRAP630R_SHOP_D_###`  | Draft query view         | selects from (extended) draft table   


![objects_to_be_extended](images/ex3_03_040_overview_of_obj_to_be_extended.png)  










#### Result

The extension project should now look like as follows:   

![Overview extensions](images/ex3_Extensions_overview_055.jpg)
  


### Exercise 3.3 - Test the field extensibility

After having extended all the objects in the hiearchy of your base RAP business object you can now leverage the additional field in the UI.

<details>
  <summary>🔵 Click to expand!</summary>

1. Open the Service Binding of the extensible RAP business object and double-click on the entity**Shop**.   
  
2. Press the **Go** button.  
  
   You should see a new column called "Feedback".   
  
   ![extended list page](images/ex3_new_field_feedback_010.png)  

3. Select one entry and use the **Edit** button
  
   ![extended object page](images/ex3_new_field_feedback_020.png)   
  
  
  > When no field is visible you should check the extension of your projection view `ZRAP630C_EXT_SHOPTP_###` and check the UI annotations.   

</details>

## Summary

You have now added a single editable field to your extensible RAP business object.   
In the next execise we will show how to add an action. 

Continue to - [Exercise 4 - Add an action ](../ex4/README.md)


