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

### Step 7

There are two ways to do step 7:

#### Pathway 1 (easier):

Make of copy of [this google sheet][4] which which look like this:
<img width="760" height="400" alt="Screenshot from 2025-11-20 21-56-21" src="https://github.com/user-attachments/assets/69c045e8-011b-4c5d-be6c-2422543e7b8c" />

<img width="760" height="400" alt="Screenshot from 2025-11-20 22-06-36" src="https://github.com/user-attachments/assets/77a33cee-3adb-4c4f-8ae4-d02fc4c5824d" />

<br>

Then, copy-paste the three columns, 'Full Name','Recipient','Attachment' from the 'certificate_sharing_helper.csv' from step 5, onto the copied sheet (from the previous step) in the corresponding position. This should result in a sheet like this:

<img width="760" height="400" alt="Screenshot from 2025-11-20 21-53-18" src="https://github.com/user-attachments/assets/17a96340-a94b-4258-8881-5bde668883bc" />
<br>
The above file will already have the Apps Script (javascript) in the extensions, which is why it shows the 'Mail Merge' button. I adapted this script from the original source code of Mail Merge, after some modifications for attachment of files uploaded in a google drive.

#### Pathway 1 (slightly harder):

Upload the 'certificate_sharing_helper.csv' into your google drive, and then open it with Google Sheets. There will be two additional columns on the left (serial number and 'type'). Ignore them. They won't affect the next steps.

Click on the Extensions -> Apps Script

<img width="760" height="400" alt="Screenshot from 2025-11-20 22-20-46" src="https://github.com/user-attachments/assets/80da4823-258b-46a9-b5e2-65c1ae6e6b79" />




Then, copy-paste the 


[1]: https://cran.rstudio.com/
[2]: https://posit.co/download/rstudio-desktop/
[3]: https://github.com/paulvpop/automated-multi-certificate-generation-and-email-sending/blob/main/R_script_for_automated_multi_certificate_generation.R
[4]: https://docs.google.com/spreadsheets/d/1ef2fK6pnlln8ad-JIGuaF3_u58qQmuwpNlmpqssBg8A/edit?usp=sharing
