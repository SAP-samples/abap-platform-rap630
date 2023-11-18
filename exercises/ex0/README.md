# Getting started

In this exercise, you will 

1. Create a SAP BTP trial account
2. Create a trial user in the SAP BTP, ABAP Environment of your SAP BTP trial account and create an ABAP Cloud Project to connect to your SAP BTP Trial, ABAP Environment
3. Start a helper class in your SAP BTP Trial, ABAP Environment that will generate several artefacts needed for the remaining exercises.

## SAP BTP Trial Account

If you have not already done so you have first to register for the SAP BTP Trial [here](https://developers.sap.com/tutorials/abap-environment-trial-onboarding.html).

## Create a trial user in ABAP Environment in SAP BTP Trial and create an ABAP Cloud Project in ADT

The steps to activate the ABAP Environment in the SAP BTP trial by creating an appropriate user have have been described in the following tutorial. This tutorial also explains how to create an ABAP Cloud project in ADT to connect to the shared ABAP trial ABAP Environment system.  

[Create an SAP BTP ABAP Environment Trial User](https://developers.sap.com/tutorials/abap-environment-trial-onboarding.html)


## Use class ZDMO_GEN_RAP630_SINGLE to generate your starter project

Now that you have created your ABAP Cloud project you will use class `ZDMO_GEN_RAP630_SINGLE` to generate packages which will be used in exercise 1 and an extensible RAP business object which will be used in the remaining exercises 2 and 3.

1. Right-click **Favorite Objects** and click **Add Object**.
   
2. Search for **`ZDMO_GEN_RAP630_SINGLE`**, select it and click **OK**.    

3. Right-click **`ZDMO_GEN_RAP630_SINGLE`**, select **Run As** > **ABAP Application (Console) F9**.

4. Now your packages `ZRAP630_###` and `ZRAP630_###_EXT` are created (where the suffix `###` denotes your group number and will contain everything you need. 
   Stay tuned and check the ABAP console. 

5. **⚠Copy the package names and the suffix for later use.**   
   In the "Project Explorer" right click on **Favorite Packages** and click on **Add Package...**.   
   Enter `ZRAP630_###` and and select **both** packages and click OK. 

## Summary

Now that you have onboarded to the SAP BTP Trial, ABAP Environment you can continue to - [Exercise 1](../ex1/README.md)
