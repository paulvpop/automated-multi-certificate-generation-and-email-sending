## Introduction

This workflow will help you automate two things:

i) creation of multiple certificates for participants/winners of an event from one or more template certificates <br>
ii) sending of emails using a template email by changing participant-appropriate text and adding attachments (like the certificates generated) if necessary

This can be useful for many events. For example, if you conduct a workshop and want to send out participation certificates, or conduct a quiz, and wants to send out participation certificates along with the different winner certificates. This can be done without having to manually make the changes on a template or sending them individually (or bcc'ing) them.

## **Steps**

Skip to step       if you only want to send emails to multiple people

### Step 1 
Create a/multiple template certificate(s) using any image/slide editing software of your choice. Canva is easiest choice as they have some pre-made certificate templates that are free to you, which you can modify. 

### Step 2 
Download the temeplate and save it to a folder titled your event name (or simply save it to that folder if you're using an offline editing application).

### Step 3

Install R (refer to the [instructions here][1]) and R Studio (refer to the [instructions here][2]) if you haven't already.

### Step 4

Download and open [this R script][3] in R Studio 

### Step 5

Follow the instructions in the R script and edit it according to your requirements.

This will produce both the individual certificates for each participant as well as certificate_sharing_helper.csv which will be used for sharing emails to individuals with their respective certificates.

### Step 6

Create a Google Drive folder (name it appropriately) and upload all the certificates generated in the previous step there, along with the certificate_sharing_helper.csv





[1]: https://cran.rstudio.com/
[2]: https://posit.co/download/rstudio-desktop/
[3]: https://github.com/paulvpop/automated-multi-certificate-generation-and-email-sending/blob/main/R_script_for_automated_multi_certificate_generation.R
