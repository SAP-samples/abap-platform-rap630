[Home - Cloud ERP Extensibility](../../../../#exercises)  

# Exercise 3 - Extend the CDS data model of the extensible RAP base business object  

In the preceeding exercise we have extended the _behavior_ of the based RAP BO by adding a determination, a validation and a side effect. 

We will now adapt the _CDS data model_, that means we will add new fields to the _Shop_ entity. 

Compared to the activities for adding additional behavior this is a larger amount of work since the complete stack of CDS views has be extended rather than only extensing the behavior definition (BDEF).

![Overview](images/ex3_01_overview_RAP630.png)

## Exercise 3.1 - Check (and adapt) the CDS data model (of the extensible base RAP BO)

In order to extend the data model of a RAP BO the base RAP BO must be enabled to support extensibility as described in the Online Help.  
[RAP Extensibility-Enablement](https://help.sap.com/docs/abap-cloud/abap-rap/rap-extensibility-enablement)

For your convenience we have generated such an extensible RAP BO `ZRAP630R_ShopTP_###` for you.

![Overview](images/ex3_02_040_show_objects_to_be_extended.png)  


## Excercise 3.2 - Extend the data structure

As shown in the schematic view above we have to extend the following objects of our extensible base BO.
  
Order of extension | Repository object name | Name           | Comment  
-------- | ---------------------- | ------------------------ | -----------------------------------------------------   
1        | `ZRAP630SSHOP_###`     | Extension include        | extends active and draft table with additional fields    
2        | `ZRAP630E_Shop_###`    | Extension include view   | selects from (extended) active table   
3        | `ZRAP630R_ShopTP_###`  | Restricted base view     | selects from (2)   
4        | `ZRAP630C_ShopTP_###`  | CDS projection view      | selects from (3)   
5        | `ZRAP630I_ShopTP_###`  | Interface view           | selects from (3)   
6        | `ZRAP630R_Shop_D_###`  | Draft query view         | selects from (extended) draft table   


![objects_to_be_extended](images/ex3_03_040_overview_of_obj_to_be_extended.png)  

<details>
  <summary>🔵 Click to expand!</summary>

### Exercise 3.2.1 - Extend the extension include with an append structure - Add a field

We start the extension of the base RAP BO by adding field to the _extension include structure_ by creating an _append structure_ .

<details>
  <summary>🔵 Click to expand!</summary>

1. Right click on the _extension include structure_ `ZRAP630SSSHOP_###` and choose **New Append Structure** from the context menue.
  
   ![Add append structure](images/ex3_03_010_RAP630.png)
  
2. In the **New Append Structure** dialogue enter the following values.

   Be sure to change the package name to `ZRAP630_###_EXT` since the wizard in ADT by default propopses the package of the include structure of your base RAP BO.   
  
   Package:     `ZRAP630_###_EXT` !!!  
   Name:        `ZRAP630EXTSSHOP_###`  
   Description: Extend Extension Include Structure  
  
   and press **Next**.   
  
   ![Addappendstructure](images/ex3_03_020_RAP630.png)

3. Select the transport request that has been created for your extension package and press **Finish**.  

   ![Addappendstructure](images/ex3_03_030_RAP630.png)
  
3. In the code editor enter the following code snippte  
  
   ```abap
      zz_feedback_zaa : abap.char(256);
   ```

   So that your code should read as follows:
  
   <pre lang="ABAP">
   @EndUserText.label : 'Extend Extension Include Structure'
   @AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
   extend type zrap630sshop_### with zrap630extsshop_05a {
   zz_feedback_zaa : abap.char(256);
   }
   </pre>

   ![Addappendstructure](images/ex3_03_030_RAP640.png)
  
 4. Activate your changes
 
</details>

### Excercise 3.2.2 - Extend the CDS views 

In the following we will explain how to extend the remaining 5 CDS view entities. Since the process (the wizard) is the same for each CDS view entity we will only show screen shots for doing this for the first CDS view that has to be extended, which is the extension of the _Extension Include View_ `ZRAP630E_Shop_###`.  

For the remaining CDS views we will only provide the code snippets.   
  
<details>
  <summary>🔵 Click to expand!</summary>

### Extend the extenstion include view 

First we have to extend our extension include view `ZRAP630E_Shop_###` since the R-view reads from this view .
  
1. Right click on the CDS view of the base RAP business object that has to be extended. In this case right click on ´ZRAP630E_Shop_###´.   

    ![e-view](images/ex3_extension_for_ext_include_005.png) 

2. Select **New Data Definition** from the context menu.

    ![e-view](images/ex3_extension_for_ext_include_010.png) 

3. In the **New Data Defintion** screen enter the following values:  

   Package: `ZRAP630_###_EXT` --> !!! Be sure to have changed the package name since ADT will propose the name of the package where your base RAP BO resides in

   Name: `ZRAP630E_Ext_Shop_###`
   Description: `Extension for Extension Include View`

   and press **Next** .

4. Select a transport request and press **Next**.
   
   > **Caution:**
   > Do **NOT** press finish, because on the following screen you have to select the template that shall be used.  
  
5. Select the template **Extend View Entity**  and press **Finish**     
    
    ![Extend View Entity template](images/ex3_Extend_view_entity_025.jpg) 
    
6. The editor window opens. Here you have to enter the following code.
  
   <pre lang="ABAP">      
     extend view entity ZRAP630E_Shop_### with {
         Shop.zz_feedback_zaa as zz_feedback_zaa
     } 
   </pre>
  
    ![CDS view extenstion](images/ex3_extension_for_ext_include_030.png)
  
</details>

### Extend the remaining CDS views 
  
You have now to extend the remaining 4 CDS views in the following order with the following code snippets as we have done this for the extension include view in Exercise 3.5.   

<details>
  <summary>🔵 Click to expand!</summary>

#### Extension for R-CDS view

Name: `ZRAP630R_EXT_SHOPTP_###`   
Package: `ZRAP630_###_EXT`  
Description: Extension for R-CDS view

> **Please note:**
> The code extension of the R-CDS view reads from the `_Extension` association as the data source.
> All other extensions read from the alias `Shop` as the data source.    

<pre lang="ABAP">
extend view entity ZRAP630R_ShopTP_### with {  
_Extension.zz_feedback_zaa as zz_feedback_zaa  
}
</pre> 
  
#### Extension for C-CDS view

Name: `ZRAP630C_EXT_SHOPTP_###`   
Package: `ZRAP630_###_EXT`  
Description: Extension for P-CDS view
  
<pre lang="ABAP">
  extend view entity ZRAP630C_ShopTP_### with {  
  
  @UI.lineItem: [ {
    position: 140 , 
    importance: #MEDIUM, 
    label: 'Feedback'
    } ]
    @UI.identification: [ {
    position: 140 , 
    label: 'Feedback'
    } ]
  
   Shop.zz_feedback_zaa as zz_feedback_zaa  
   }
</pre>  
  
#### Extension for I-CDS view  

Name: `ZRAP630I_Ext_ShopTP_###`   
Package: `ZRAP630_###_EXT`  
Description: Extension for interface view
  
<pre lang="ABAP">
extend view entity ZRAP630I_ShopTP_### with {  
Shop.zz_feedback_zaa as zz_feedback_zaa 
}
</pre>
  
    
####  Extension for draft query view

Name: `ZRAP630R_Ext_Shop_D_###`   
Package: `ZRAP630_###_EXT`  
Description: Extension for draft query view
  
<pre lang="ABAP">
extend view entity ZRAP630R_Shop_D_### with {  
Shop.zz_feedback_zaa as zz_feedback_zaa 
}
</pre>

#### Result

The extension project should now look like as follows:   

![Overview extensions](images/ex3_Extensions_overview_055.jpg)
  
</details>

</details>

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


