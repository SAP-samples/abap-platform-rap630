[Home - Cloud ERP Extensibility](../../../../#exercises)  

# Exercise 3 - Extend the CDS data model of the extensible RAP base business object  

## Introduction  

In the preceeding exercise we have extended the _behavior_ of the based RAP BO by adding a determination, a validation and a side effect. 

We will now adapt the _CDS data model_, that means we will add new fields to the _Shop_ entity. 

Compared to the activities for adding additional behavior this is a larger amount of work since the complete stack of CDS views has be extended rather than only extensing the behavior definition (BDEF).

![Overview](images/Extensibility_Extend_the_data_model.png)

> In order to extend the data model of a RAP BO the base RAP BO must be enabled to support extensibility as described in the Online Help.  
> [RAP Extensibility-Enablement](https://help.sap.com/docs/abap-cloud/abap-rap/rap-extensibility-enablement)
> For your convenience the generated RAP BO `ZRAP630R_ShopTP_###` that has been prepared for your convenience supports the extensibility of the data model.  

As shown in the schematic view above we have to extend the following objects of our extensible base BO.
  
Order of extension | Repository object name | Name           | Comment  
-------- | ---------------------- | ------------------------ | -----------------------------------------------------   
1        | `ZRAP630SSHOP_###`     | Extension include        | extends active and draft table with additional fields    
2        | `ZRAP630E_Shop_###`    | Extension include view   | selects from (extended) active table   
3        | `ZRAP630R_ShopTP_###`  | Restricted base view     | selects from (2)   
4        | `ZRAP630C_ShopTP_###`  | CDS projection view      | selects from (3)   
5        | `ZRAP630I_ShopTP_###`  | Interface view           | selects from (3)   
6        | `ZRAP630R_Shop_D_###`  | Draft query view         | selects from (extended) draft table   


## Step-by-Step guide

While for **SAP BTP ABAP Environment** and for **SAP S/4HANA Cloud ABAP Environment** there is an [extension field wizard](https://help.sap.com/docs/abap-cloud/abap-development-tools-user-guide/generating-extension-fields) available.

In **SAP S/4HANA 2023** you have to create the extension objects for the objects mentioned above **manually**.  

Therefore we have to different how-to-guides depending on the type of ABAP system you are working on.

Continue here when working in **SAP BTP ABAP Environment** or **SAP S/4HANA ABAP Environment**:  

[Exercise 3 - Add a field with the field extensibility wizard ](../ex3/README_ABAP_ENVIRONMENT.md)


Continue here when working in an on premise or private cloud **SAP S/4HANA 2023** system :

[Exercise 3 - Add a field manually ](../ex3/README_2023.md)


## Summary

You have now added a single editable field to your extensible RAP business object.   
In the next execise we will show how to add an action. 

Continue to - [Exercise 4 - Add an action ](../ex4/README.md)



