[Home - Cloud ERP Extensibility](../../README.md#-exercises)

# Getting started

In this exercise, you will start a helper class that will generate several artefacts needed for the remaining exercises.

<!--  
> For **⚠  SAP lead events** users   
> Please skip the following step, because the packages have been pre-generated for convenience in the dedicated workshop system.   
-->   

You will use class `ZDMO_GEN_RAP630_SINGLE` to generate two packages. 

The first package `ZRAP630_###` will contain an extensible RAP business object which you will extend in exercise 2.

You will use the second package `ZRAP630_###_EXT` to store the objects that you are going to create in Excerise 1 and Exercise 2.

1. Right-click **Favorite Objects** and click **Add Object**.
   
2. Search for **`ZDMO_GEN_RAP630_SINGLE`**, select it and click **OK**.    

3. Right-click **`ZDMO_GEN_RAP630_SINGLE`**, select **Run As** > **ABAP Application (Console) F9**.

   ![Run_via_f 9](images/run_via_f9_0020.png)

4. Now your packages `ZRAP630_###` and `ZRAP630_###_EXT` are created (where the suffix `###` denotes your group number and will contain everything you need. 
   Stay tuned and check the ABAP console. 

5. **⚠Note down the suffix `###` for later use.**

6. In the "Project Explorer" right click on **Favorite Packages** and click on **Add Package...**.   
   Enter `ZRAP630_###` and and select **both** packages and click OK. 
 
   ![Package](images/packages_0030.png)
 
## Summary

Now that you have generated your own extensible RAP business object you can continue to - [Exercise 1](../ex1/README.md)
