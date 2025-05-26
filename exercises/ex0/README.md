[Home - Cloud ERP Extensibility](../../README.md#-exercises)

# Getting started

There are three options 

- **Option 1**: You conduct these exercises at an SAP event where we provide you with a dedicated system and a dedicated demo user.   
- **Option 2**: You conduct these exercises on your own in one of the shared ABAP trial systems.   
- **Option 3**: You condcut these exercises on your own in your own SAP BTP ABAP Environment system.   

<details>   
        <summary>Option 1 - SAP led hands-on exercise</summary>  

In case of an SAP led hands-on session we have prepared the followign for your convenience: 

- two exercise packages `ZRAP630_###` and `ZRAP630_###_EXT` and
- an extensible managed Business Object (BO) with one entity _Shop_ with generic transactional behavior - i.e. CRUD: Create, Read, Update, and Delete. 

1. **⚠Check the suffix `###` of your demo user (e.g. developer-###@abapcloud.sap).**

2. In the "Project Explorer" right click on **Favorite Packages** and click on **Add Package...**.   
   Enter `ZRAP630_###` and and select **both** packages and click OK. 

</details>

<details>   
        <summary>Option 2 - Self study in SAP BTP Trial</summary>  

In this exercise, you will start a helper class that will generate several artefacts needed for the remaining exercises.

You will generate 
- two exercise packages and
- an extensible managed Business Object (BO) with one entity _Shop_ with generic transactional behavior - i.e. CRUD: Create, Read, Update, and Delete. 

<!--  
> For **⚠  SAP lead events** users   
> Please skip the following step, because the packages have been pre-generated for convenience in the dedicated workshop system.   
-->   

You will use class `ZDMO_GEN_RAP630_SINGLE` to generate two packages. 

> ⚠️ Please note that if you don't find this class you have to import the openSource RAP Generator first as described in the 
> section [Getting started](../../README.md#requirements-for-attending-this-workshop)  

The first package `ZRAP630_###` will contain an extensible RAP business object which you will extend in exercise 2.

You will use the second package `ZRAP630_###_EXT` to store the objects that you are going to create in Excerise 1 and Exercise 2.

1. Right-click **Favorite Objects** and click **Add Object**.
   
2. Search for **`ZDMO_GEN_RAP630_SINGLE`**, select it and click **OK**.    

3. Right-click **`ZDMO_GEN_RAP630_SINGLE`**, select **Run As** > **ABAP Application (Console) F9**.

   ![Run_via_f 9](images/run_via_f9_0020.png)

4. Now your packages `ZRAP630_###` and `ZRAP630_###_EXT` will now be created   
   (where the suffix `###` denotes your group number and will contain everythin g you need).   

   > ⚠ **The generation process will take a few minutes.**   
   > ⚠ So, stay tuned and check the ABAP console.     

   ![Console tab result](images/Console_result.png)

5. **⚠Note down the suffix `###` for later use.**

6. In the "Project Explorer" right click on **Favorite Packages** and click on **Add Package...**.   
   Enter `ZRAP630_###` and and select **both** packages and click OK. 
 

   ![Package](images/packages_0030.png)   
   
</details>

 
## Summary

Now that you have generated your own extensible RAP business object you can continue to - [Exercise 1](../ex1/README.md)
