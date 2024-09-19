[Home - Cloud ERP Extensibility](../../../../#exercises)



# Exercise 1: New App on stack (Developer Extensibility)

⚠️ Be sure to have run the helper class **`ZDMO_GEN_RAP630_SINGLE`** as described in the **[Getting started section](../ex0/#readme)** that generates the packages and repository objects needed for this hands-on session.  

## Introduction

In Exercise 1.1 you will build a custom UI on top of the released API **I_BankTP**. This application will allow you to create a bank.  

As an additional (optional) Exercise 1.2 you can try out to consume this released API in a class via EML.   

![New App on Stack](images/Scenario_New_App_on_stack.png)  

We will start by showing you how you can search for a released RAP business object. For this we will use the *Released Objects* part of the *Project Explorer* in ADT.   


> **Reminder:**   
> Don't forget to replace all occurences of the placeholder **`###`** with your group ID in the exercise steps below.  
> You can use the ADT function **Replace All** (**Ctrl+F**) for the purpose.   
> When you don't know your group number anymore you can check the transport that has been created when you repository objects have been generated. 
> Here you can check for example the name of the generated package.
>
> ![GroupID](images/00_010_RAP630.png)



## Exercise 1.1: Generate a UI on top of a released Business Object Interface

In Exercise 1.1 you will build a custom UI on top of the released API **I_BankTP**. 


<details>
  <summary>Click to expand!</summary>

  1. In the Project Explorer select the **Released Objects** tree and then the node **USE_IN_CLOUD_DEVELOPMENT**. Here you have to open the folder **Core Data Services** and then the folder **Behavior Definitions** where you find the C1-released Business Object Interface `I_BankTP`.

      ![interface](images/001-find-interface.png)

  2. Right-click on the interface  `I_BankTP` and select **Generate ABAP Repository Objects**  

      ![interface](images/002-start-generator.png)

  3. Select **OData UI Service** and then **Next**   

      ![generator](images/003-odata-ui-service.png)  

  4. Select the package `ZRAP630_###_EXT` where `###` is the unique ID chosen by the generator class by pressing the **Browse** button and press **Next**.

      ![generator](images/004-select-package.png)  

  5. The generator finishes with the *Configure Generator* screen. 

     ![Service Projection Entities](images/005-configure-generator.png) 
      
     When you want to change the names of the repository objects that will be generated you can do so by selecting the entries **Service Projection Entities**, **Service Projection Behavior**, **Service Definition** and **Service Binding**.  Since the generator will suggest unique names we will leave those default values unchanged.

      Press **Next** to continue.   

  7. The wizard shows an overview of the repository objects that are going to be generated. Press **Next**.   

      ![eclipse](images/010-abap-artifacts-list.png)  

  8. Select the transport that has been created for the package `ZRAP630_###_EXT` or create a new transport and press **Finish** to start the generation of the repository objects.   

      ![eclipse](images/011-select-transport.png)  
    

### Publish service and test the application 

1. When the generation process is finished a new tab with the generated Service Binding will be opened in ADT. Click **Publish** to publish the service binding locally. In the project explorer you can see all objects that have been generated.    

      ![result](images/012-result-service-binding.png)

      ![result](images/013-result-project-explorer.png)

2. Select the entity set `Bank` and click **Preview** or double-click on the entity set `Bank`. This will start the SAP Fiori Elements preview.  

      ![Fiori Elements Preview](images/014-start-fiori-elements-preview.png)

3. In the preview of your app press the button **Create** to create a new bank.

      ![Fiori](images/015-create-new-bank.png)


4. Enter values in the fields **Bank Country / Region** e.g. `CZ` and **Bank Key** e.g. `1234` and press **Continue**.

      ![Fiori](images/016-create-new-bank.png)

5. The object page opens and you have to provide data for the remaining mandatory fields such as the **Bank Name**.  

      ![Fiori](images/017-create-new-bank.png)  


### Troubleshooting

<details>
  <summary>Click to expand!</summary>

1. When your development user does not have the authorization to create new banks you will receive the following error message: **You are not authorized to create bank data for country/region CZ.**   

      ![result](images/020-missing-authorizations.png)    

2. In order to identify the missing authorizations you can check the **Knowledge Transfer Document** of `I_BANKTP`. Either open it using the shortcut **Ctrl+Shift+A** or navigate to it in the Project Explorer as shown as shown below.  

      ![result](images/022-check-own-context.png)

3. As you can see the business object `I_BankTP` checks for the authorization objects `F_BNKA_MAO` and `F_BNKA_INT`.  

      ![result](images/021-check-own-context.png)


      ![F_BNKA_INT](images/F_BNKA_INT.png)

      ![F_BNKA_MAO](images/F_BNKA_MAO.png)  

> ⚠️  
> The issue can only be resolved by creating an appropriate IAM app, assigning the same to a business catalog which in the end has to be assigned to a new or existing role that has to be assigned to your user.  
> In the next (optional) exercise where the BO is called as an API we show a workaround how the API can be called in a so called priveliged mode.  

</details>  
</details>  

## Exercise 1.2: Use a released RAP BO in a custom application (optional)
[^Top of page](#)

A second typical use case where released API's in an SAP S/4HANA system are used for, is using such an API in your own code that might for example be consumed as part of an application job. 

<details>
  <summary>This is an optional exercise.</summary>


> Create a class ![class](images/adt_class.png) in the extension package `ZRAP630_###_EXT` to test the effects of using the language version *ABAP for Cloud Development*.   

 <details>
  <summary>Click to expand!</summary>

  1. Right-click on your ABAP package **`ZRAP630_###_EXT`** and select **New** > **ABAP Class** from the context menu.

      ![package](images/01_010_rap630.png). 
  
  2. Maintain the required information (`###` is your group ID).
      - Name: **`zcl_test_abap_cloud_###`**
      - Description: _**`Test ABAP Cloud Governance`**_                  

      Click on **Add** and select the interface `if_oo_adt_classrun` and press OK. 

      and click **Next >**

      ![package](images/01_020_rap630.png). 

  3. Select or create a transport request, and click **Finish** to create the class.

  4. Replace the code in the method  `if_oo_adt_classrun~main( )` with the following code snippet.
     
     > Tip
     > You have to replace the value for **'####'** with a string that only contains numbers.   

     > Coding explained:  
     > The coding leverages the `response` parameter of EML statements that is used to specify response parameters for ABAP EML statements
     > to get information on the following:  
     > - Failures, i. e. operations that could not get processed (FAILED failed_resp)   
     > - Key mapping information (MAPPED mapped_resp)   
     > - Returned error messages (REPORTED reported_resp)   
  
     <pre lang="ABAP">  
     METHOD if_oo_adt_classrun~main.
     
      DATA create_bank TYPE STRUCTURE FOR CREATE i_banktp.
      DATA bank_id_number TYPE i_banktp-BankInternalID VALUE '8###'.

      create_bank = VALUE #( bankcountry = 'CZ'
                           bankinternalid = bank_id_number
                           longbankname = 'Bank name'
                           longbankbranch = 'Bank branch'
                           banknumber = bank_id_number
                           bankcategory = ''
                           banknetworkgrouping = ''
                           swiftcode = 'SABMGB2LACP'
                           ismarkedfordeletion = ''
                    ).



      MODIFY ENTITIES OF i_banktp
      ENTITY bank
      CREATE FIELDS ( bankcountry
                    bankinternalid
                    longbankname
                    longbankbranch
                    banknumber
                    bankcategory
                    banknetworkgrouping
                    swiftcode
                    IsMarkedForDeletion
                 )
       WITH VALUE #( (
       %cid = 'cid1'
         bankcountry         = create_bank-bankcountry
         bankinternalid      = create_bank-bankinternalid
         longbankname        = create_bank-longbankname
         longbankbranch      = create_bank-longbankbranch
         banknumber          = create_bank-banknumber
         bankcategory        = create_bank-bankcategory
         banknetworkgrouping = create_bank-banknetworkgrouping
         SWIFTCode           = create_bank-SWIFTCode
         IsMarkedForDeletion = create_bank-IsMarkedForDeletion
         )  )

       MAPPED DATA(mapped)
       REPORTED DATA(reported)
       FAILED DATA(failed).

      LOOP AT reported-bank INTO DATA(reported_error_1).
      DATA(exc_create_bank) = cl_message_helper=>get_longtext_for_message(
        EXPORTING
          text               = reported_error_1-%msg
        ).
        out->write( |error { exc_create_bank } |  ).
      ENDLOOP.


      COMMIT ENTITIES
      RESPONSE OF i_banktp
      FAILED DATA(failed_commit)
      REPORTED DATA(reported_commit).



      LOOP AT reported_commit-bank INTO DATA(reported_error_2).
      DATA(exc_create_bank2) = cl_message_helper=>get_longtext_for_message(
        EXPORTING
          text               = reported_error_2-%msg
      ).
      out->write( |error { exc_create_bank2 } |  ).
      ENDLOOP.
      IF reported_commit-bank IS INITIAL.
      COMMIT WORK.

      SELECT SINGLE * FROM I_Bank_2 WHERE BankInternalID = @bank_id_number INTO @DATA(my_bank).
      out->write( |my new bank { my_bank-BankName } { my_bank-BankInternalID }| ).
      ENDIF.
     ENDMETHOD.
     </pre>   

  5. Activate your changes by pressing **Ctrl+F3**

  6. Run the test class by pressing **F9**.  

     You will notice that an error message is thrown. Namely `error You are not authorized to create bank data for country/region CZ.` 
     Consequently also no new data is found. 

     ![test class](images/error.png)      
     
  7. Adding **PRIVILEGED** to the EML call

     When we add the key word `PRIVILEGED` to our EML call the authorization checks for the authorization objects
     `F_BNKA_MAO` and `F_BNKA_INT` will basically be skipped.

     <pre lang="ABAP">
     MODIFY ENTITIES OF i_banktp
     PRIVILEGED
     ENTITY bank
     CREATE FIELDS ( bankcountry
                    bankinternalid
                    longbankname
                    ...
     </pre>    
     
     When you now run the class again using F9 you will find that the creation of a new bank seem to have worked.

     However the select statement is not able to retrieve the newly created data.

     <details>
        <summary>Click to learn more about the PRIVILEGED EML access</summary>
     

       We will now check the behavior definition of the Bank RAP business object. To do so use Ctrl+Shift+A to open the behavior definition `R_BankTP`.
     
       In the source code (see below) we see that the BDEF `R_BankTP` defines two so called authorization contexts:

        _Own authorization context_ : Lists all authorization objects used by the RAP BO implementation.   
        _NoCheckWhenPrivileged_ : Lists authorization objects that can be skipped by a RAP BO consumer with privileged access.   

       ```abap
       managed with unmanaged save implementation in class bp_r_banktp unique;
       strict ( 2 );
       with draft;
       extensible
       {
         with additional save;
         with determinations on modify;
         with determinations on save;
         with validations on save;
       }

       with privileged mode disabling NoCheckWhenPrivileged;

       //NoCheckWhenPrivileged
       define authorization context NoCheckWhenPrivileged
       {
        'F_BNKA_MAO';
        'F_BNKA_INT';
        }

       ```
    
     
     </details>  
     
  8. Adding **WITH PRIVILEGED ACCESS** to the ABAP SQL statement
  
     Similar to enforce skipping the authorization checks when creating a new bank it is also possible to enforce skipping of the authorization check that is imposed by the underlying DCL which performs a check on the authorization object `F_BNKA_MAO` and the field `BBANKS` for displaying data.  
     
     Open the DCL  and check its source code. 

     To do so press **Ctrl+Shift+A** and enter **I_Bank_2** to search for the DCL objects.          
     
     ![PRIVILEGED 1](images/06_020_RAP630.png)   
     
     ![PRIVILEGED 1](images/06_030_RAP630.png)   
     
     When we now change the ABAP SQL statement in class **`zcl_test_abap_cloud_###`** such that we add the key words ` WITH PRIVILEGED ACCESS` to it:   
     
     <pre lang="ABAP">

       METHOD if_oo_adt_classrun~main.

       ....
       
       SELECT SINGLE * FROM I_Bank_2
       WITH PRIVILEGED ACCESS
       WHERE BankInternalID = @bank_id_number INTO @DATA(my_bank).

       ....
       
       ENDMETHOD.
     </pre>
     
     we see that the data is now successfully been created and can also be read.  
     
  
     ![PRIVILEGED 1](images/06_040_RAP640.png)   
     
  
   10. Other potential problems
  
      The I_BankTP RAP BO checks whether the provided switft code fits to the ISO code of the region. 
  
       - error ISO code GB in the SWIFT code SABMGB2LACP is not correct for country/region US. Diagnosis Positions 5 and 6 of the SWIFT code do not correspond to the ISO code of country/region US. Procedure Check your entries. If necessary, check whether the ISO code of country/region US has been defined correctly.  
       
      When a bank with the ID that is provided already exists you will receive an error message as well.

       - error Bank CZ 8888 already exists.
  
 </details>  
 
 <!--- 
  
 ## Exercise 1.2: Examine the documentation of the released RAP BO I_BankTP
 
[^Top of page](#)

The documentation for a released RAP business object can be found in so called **Knowledge Transfer Documents** which have the same name as the business object (released API) it describes.     

 <details>
  <summary>Click to expand!</summary>

  1. You can find the **Knowledge Transfer Document** of a realeased API in the folder **Documentation** underneath the business object in the Project Explorer.
  
     It can also be opened from within the source code editor of your behavior definition. Here you find the link at the top of the source code of the behavior definition.

     ![KTD](images/02_20_rap630.png) 

  2. The **Knowledge Transfer Document** can also be opened directly via the **Open Development Object** dialogu that can be opened via the menu or via the short cut **Ctrl+Shift+A**.  

     ![KTD](images/02_30_rap630.png) 

  3. When you have opened the **Knowledge Transfer Document** you should change from the **Source** tab to the more appealing visualization of the **Output** tab.  

     ![KTD](images/02_40_rap630.gif)  

  4. The **Knowledge Transfer Document** provides you with code snippets that help you to write code to perform the operation (e.g. *create* as shown below) or an action which is supported by this business object.  

     ![KTD](images/02_50_rap630.png)     


These code templates have been used to create the test class that calls the API **I_BankTP** in order to create purchase requisitions in the last excercise.

</details> 



## Exercise 1.3: Find the released RAP BO I_BankTP as a successor of table BNKA
[^Top of page](#)

<details>
  <summary>Click to expand!</summary>

1. Open the test class **`zcl_test_abap_cloud_###`** that you have created in **Exercise 1.1.**.

2. Copy the code snippet provided below and add it add the and in the implementation section of the methode `main`. 
 
   > **Hint**: Hover the code snippet and choose the _Copy raw contents_ icon ![copy_raw_content](../../images/copyrawcontents.png) appearing in the upper-right corner to copy it. 
   
   <pre lang="ABAP">
    
    "... the code with the EML statement

    DATA bank_address  TYPE bapi1011_address.
    DATA bank_ctry  TYPE banks  .

    CALL FUNCTION 'BAPI_BANK_CREATE'
      EXPORTING
        bank_ctry    = bank_ctry
        bank_address = bank_address
    "  IMPORTING
    "       return       =
    "       bankcountry  =
    "       bankkey      =
      .

    SELECT * FROM bnka WHERE bankl = '0010001516' INTO TABLE @DATA(my_banks).
  
   </pre>


   Since your class **`zcl_test_abap_cloud_###`** uses the ABAP Cloud development model (ABAP language version “ABAP for Cloud development”) the source code now 
   cannot be compiled anymore because of several ABAP statements containing syntax-errors:

    - Line 103: The use of Table **BAPI1011_ADDRESS** is not permitted.	
    - Line 104: The use of Data Element **BANKS** is not permitted.	
    - Line 106: The use of Function Module **BAPI_BANK_CREATE** is not permitted, but for this function module a successor is available, namely the Behavior   Definition **`I_BANKTP`**. 	
    - Line 116: The use of Table **BNKA** is not permitted. Use CDS Entity **I_BANK_2** instead.
             
    ![package](images/01_040_rap630.png).
  
      
3. The effect of the release state **Not to Be Released** in combination with a successor is illustrated below for the table `BNKA`, which was replaced by the CDS view `I_BANK_2`. When you open an object such as `BNKA` for which a success is maintained you see this information also in the **Properties** in ADT where you have the option to conveniently navigate to the successor object.   
   
    ![package](images/01_050_rap630.png). 

 
4. In order to activate your class again you would have to comment out or remove the forbidden statements. 
 

</details>

--->

</details>
 </details> 

</details>

## Summary 
[^Top of page](#)

Now that you've have learned about how to leverage the released API **I_BankTP** in *ABAP Cloud* you can continue with the next exercise where you will learn how to extend an extensible RAP business object- **[Exercise 2](../ex2/#readme)**.

## Further Reading
[^Top of page](#)

<details>
  <summary>Click to expand!</summary>

### No Information in your system ? --> Find information about Released API's in GitHub

While developing an ABAP Application for _S/4HANA on premise_ or _S/4HANA private cloud edition_ , you do get the following error message: "Use of <Object Type> <Object Name> is not permitted". 
 
But the error message does not provide a hint which API or object to use instead. The reason is that the successor information in on premise system does not contain the latest updates such as in SAP S/4HANA Cloud, ABAP Environment system or SAP BTP, ABAP Environment.   

An example would be the table `BNK2`.  

 You as a developer nevertheless want to find out which objects to use intstead and to check their documentation.   
 
  1. Check out the GitHub repository. 
  
     The repository contains the list of released APIs of S/4HANA Cloud. In addition also the objects that are not released are contained with the specification of successor objects. All objects are contained in one JSON file. This file is used as content for the ABAP Test Cockpit Check "Usage of Released APIs (Cloudification Repository)". This check can be used by customers and partners to analyse existing custom code concerning the usage of released and not released APIs on all ECC and S/4HANA releases. The check is available in SAP BTP, ABAP environment.
     
     [S/4 HANA Cloud - Released objects for ATC Check (Cloudification Repository)](https://github.com/SAP/abap-atc-cr-cv-s4hc).
     
     When we check the **csv file** that is public available we can retrieve a list of successors for the table BNKA.  
 
     ![MARA](images/02_10_rap630.png)  
   
     While csv files are nice for human beings, computers prefer json files.  
 
     [Link to json sample file](https://raw.githubusercontent.com/SAP/abap-atc-cr-cv-s4hc/main/src/objectReleaseInfo_2208.json) 


 You can continue with the next exercise - **[Exercise 2.1](../ex2/#readme)**.
  
 </details>  


