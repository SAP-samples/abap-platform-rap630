[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/abap-platform-rap630)](https://api.reuse.software/info/github.com/SAP-samples/abap-platform-rap630)

# RAP630 - Use ABAP Cloud for developer extensibility
https://github.com/SAP-samples/abap-platform-rap630/tree/main
<!--- Register repository https://api.reuse.software/register, then add REUSE badge:

1. The LICENSE file:
In most cases, the license for SAP sample projects is `Apache 2.0`.

2. The .reuse/dep5 file: 
The [Reuse Tool](https://reuse.software/) must be used for your samples project. You can find the .reuse/dep5 in the project initial. Please replace the parts inside the single angle quotation marks < > by the specific information for your repository.

3. The README.md file (this file):
Please edit this file as it is the primary description file for your project. You can find some placeholder titles for sections below.


[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/REPO-NAME)](https://api.reuse.software/info/github.com/SAP-samples/REPO-NAME)
-->

## Description

This repository contains the material for the RAP hands-on workshop called _RAP630 - Use ABAP Cloud for developer extensibility_.  

Developer extensibility as defined by SAP basically encompasses two activities 

1. Develop custom code to implement your own business logic. Here you can make use of existing API's from SAP that have been released for that purpose.
2. Extend an existing RAP Business Object so that additional business functionality is added. Such an extensible RAP business object will usually reside in another software components or it is an existing extensible RAP BO that has been delivered by SAP or a SAP partner. By extending the funcitionality of an existing RAP Business object its functionality can be adapted to your specific business requirements.

## Overview

This session introduces attendees to the ABAP Cloud programming model and how this can be leveraged to build extensions (own code) in SAP S/4HANA BTP, ABAP Environment or how you can extend an existing RAP Business Object using the ABAP Cloud programming model.   

## Requirements

The requirements to follow the exercises in this repository are:

- You have installed the latest version of the ADT tools    
- You have a user in a _SAP BTP, ABAP Environment_ system:  

   > In a hand-on workshop at SAP TechEd or any other event a dedicated demo system might be provided,
   > in this case the service key and user credentials will be provided to you by the trainer of the workshop.   
   
   > If you are following this script on your own or as part of a TechEd jump start session
   > you will have to create a user in one of the shared _SAP BTP, ABAP Environment Trial Systems_
   > as described in our [Getting Started](exercises/ex0/) section.   

   > If you want to conduct this workshop in your own SAP BTP, ABAP Environment system or your own SAP S/4HANA, ABAP Environment system,
   > you first have to install the [openSource RAP Generator](https://github.com/SAP-samples/cloud-abap-rap).  

## Slides
[Presentation](https://github.com/SAP-samples/teched2023-DT182v/blob/5468676ccceadbda6e9b16432f12194a7de3eb39/slides/AD182v%40SAP_TechEd_2023_final_RAP_Extensibility_JS.pdf) 

## Exercises

In the _Getting Started_ section we describe how you get a user in the ABAP Environment of SAP BTP Trial which you will have to use to perform the exercises in this session. After you have created this trial user you will will an ABAP Cloud project to connect or your trial instance. Here you will generate an extensible managed Business Object (BO) with one entity _Shop_ with generic transactional behavior - i.e. CRUD: Create, Read, Update, and Delete. For your convenience, the class **`ZDMO_GEN_RAP630_SINGLE`** is provided to you to generate the package  **`ZRAP630_###`** alongside with the aforementioned RAP business object after execution.

In _Exercise 1_ you will learn how to leverage the released RAP BO `I_BankTP` . 

In _Exercise 2_ you will _extend the behavior_ of the base RAP business object that has been generated at the end of the Getting Started section. You will learn how extend the behavior of the base RAP BEO by validations, determinations and side effects. 

In _Exercise 3_ you will then continue to _extend the data model_ with additional fields. This requires you to perform several steps and you have to create quite a lot of repository objects. (There is a plan to provide a Generator for that.)  

In _Exercise 4_ you will continue to _extend the behavior_ of the base RAP business object by adding an action. Since actions can only added via an extension to fields that have been added via an extension as well, adding an action via an extension must be performed after Exercise 3.   


So let us start and have a look at the _Getting Started_ section.

- [Getting Started](exercises/ex0/)
- [Exercise 1 - Consume a released RAP BO](exercises/ex1/)
- [Exercise 2 - Extend the behavior (determinations, validations, side-effects)](exercises/ex2/)
- [Exercise 3 - Extend the data model (add additional fields)](exercises/ex3/)
- [Exercise 4 - Extend the behavior (add an action)](exercises/ex4/)

## Online Help

https://help.sap.com/docs/abap-cloud/abap-rap/develop-rap-extensions
https://help.sap.com/docs/SAP_S4HANA_CLOUD/6aa39f1ac05441e5a23f484f31e477e7/1b345c53060846b091f55ea901e21ae7.html

## Download and Installation

The packages **ZRAP630_SOL** and **ZRAP630_SOL_EXT** that contain the solutions of this workshop can be downloaded via abapGIT into an *SAP BTP, ABAP Environment* system or into the *SAP S/4HANA Cloud, ABAP environment* system.

> Please note that these packages have already been installed in the SAP BTP, ABAP Environment Trial systems !   
> So there is no need to install them on an ABAP Environment trial system.   

<details>
  <summary>Click to expand download and installation steps.</summary>

  The steps to download and install the package of the base RAP business object can be found here:   
   
1. Create a package **'ZRAP630_SOL'** with **'ZLOCAL'** as the superpackage.  
2. Link this package with the URL of the RAP630 GitHub repository `https://github.com/SAP-samples/abap-platform-rap630`.
3. Use the branch `main`.
4. Pull changes.
5. Use mass activation to activate the objects that have been imported in step 3.
6. Publish the service binding `ZRAP630UI_SHOP_O4_SOL`.

   After you have performed the aforementioned steps you can continue to download the solution package of the extension project **ZRAP630_SOL_EXT**.

   Since these are stored for technical reasons in another Github repository **abap-platform-rap630-ext** you have to
   to download the source from that repository 'https://github.com/SAP-samples/abap-platform-rap630-ext'.
   
   
</details>

## Known Issues
<!-- You may simply state "No known issues. -->

## How to obtain support
[Create an issue](https://github.com/SAP-samples/<repository-name>/issues) in this repository if you find a bug or have questions about the content.
 
For additional support, [ask a question in SAP Community](https://answers.sap.com/questions/ask.html).

## Contributing
If you wish to contribute code, offer fixes or improvements, please send a pull request. Due to legal reasons, contributors will be asked to accept a DCO when they create the first pull request to this project. This happens in an automated fashion during the submission process. SAP uses [the standard DCO text of the Linux Foundation](https://developercertificate.org/).

## Code of Conduct
Please read the [SAP Open Source Code of Conduct](https://github.com/SAP-samples/.github/blob/main/CODE_OF_CONDUCT.md).

## License
Copyright (c) 2023 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSE) file.
