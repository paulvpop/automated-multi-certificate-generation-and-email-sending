## **Steps involved**

Skip to step 7 if you only want to send emails to multiple people

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

If you don't have any attachments, you can simply create fill up the 'Full Name' and 'Recipient' columns (and also have an empty 'Email Sent' column) as seen below.

There are two ways to do step 7:

#### Pathway 1 (easier):

Make of copy of [this google sheet][4] which which look like this:
<img width="760" height="400" alt="Screenshot from 2025-11-20 21-56-21" src="https://github.com/user-attachments/assets/69c045e8-011b-4c5d-be6c-2422543e7b8c" />

<img width="760" height="400" alt="Screenshot from 2025-11-20 22-06-36" src="https://github.com/user-attachments/assets/77a33cee-3adb-4c4f-8ae4-d02fc4c5824d" />

<br>

Then, copy-paste the three columns, 'Full Name','Recipient','Attachment' from the 'certificate_sharing_helper.csv' from step 5, onto the copied sheet (from the previous step) in the corresponding position. This should result in a sheet like this:

<img width="760" height="400" alt="Screenshot from 2025-11-20 21-53-18" src="https://github.com/user-attachments/assets/17a96340-a94b-4258-8881-5bde668883bc" />
<br>
The above file will already have the Apps Script (javascript) in the extensions, which is why it shows the 'Mail Merge' button. I adapted this script from the original source code of Mail Merge (by Martin Hawksey), after some modifications for attachment of files uploaded in a google drive.

#### Pathway 2 (slightly harder):

Upload the 'certificate_sharing_helper.csv' into your google drive, and then open it with Google Sheets. There will be two additional columns on the left (serial number and 'type'). Ignore them. They won't affect the next steps.

Click on the Extensions -> Apps Script

<img width="760" height="400" alt="Screenshot from 2025-11-20 23-02-57" src="https://github.com/user-attachments/assets/f030770f-4bef-4f6e-b24c-bc1dd28dcd55" />


This will lead to the following window:
<img width="760" height="400" alt="Screenshot from 2025-11-20 22-24-28" src="https://github.com/user-attachments/assets/169fa92e-3cf8-4780-97f9-2b0c352c5eb2" />

Remove/delete the above selected text/code and instead copy-paste the code [from here][5] onto the empty space.

Then save it:
<br>
<img width="760" height="400" alt="Screenshot from 2025-11-20 22-29-04" src="https://github.com/user-attachments/assets/62691cff-ef1c-4f86-afde-648bbf325874" />

### Step 8

Create a draft email. The text within the two curly brackets are columns in the auto-email-sender sheet. For example, the following case, Full Name is added within the curly brackets. This means, in the multiple emails that will be sent out, the names will be changed (taken sequentially from the rows of the column 'Full Name'. So, the email will first go to Marie Curie, then Charles Darwin, then Nikola Tesla...with the {{Full Name}} replaced by Marie Curie, Charles Darwin, Nikola Tesla etc

<img width="700" height="650" alt="Screenshot from 2025-11-20 22-52-05" src="https://github.com/user-attachments/assets/baf4fe8e-6760-4125-99c9-466d798ca8c7" />
<br>
If there are additional columns like 'type' as seen under 'Pathway 2', then that too can be added as a variable in the draft:
<img width="700" height="650" alt="image" src="https://github.com/user-attachments/assets/69974ffc-870e-44fd-8b4c-49d661ae8cdf" />


### Step 9

Copy the subject line of the email. In this case, it is "Certificate for the Global Bird Quiz".

Open the Apps Script of auto-email-sender sheet (if not already open) and replace the subject line "Certificate for the event XYZ" in the script at line 62, with the copied subject line of the draft email <br>
<img width="1439" height="214" alt="image" src="https://github.com/user-attachments/assets/db108fdd-e613-404f-b9ab-c4d963ceab0f" />

### Step 10

Skip if you don't have any attachments.

Copy the folder id from the url bar of the google drive folder containing the attachments (the alphanumeric string after the 'folders/'):
<img width="1052" height="202" alt="image" src="https://github.com/user-attachments/assets/8261926f-52be-4ea5-89f2-3de33eb129da" />

Then replace the string at line 138 in the Apps Script code (SPECIFIC_FOLDER_ID) with the copied string:
<img width="1439" height="214" alt="image" src="https://github.com/user-attachments/assets/99a6aa90-63d2-4743-976a-d7531239a7e5" />

### Step 11

Now, everything is set and you need to press on the button 'Mail Merge' in the auto-email-sender sheet, and press 'Sent Emails':
<img width="1081" height="178" alt="image" src="https://github.com/user-attachments/assets/fa70e813-f712-4537-b3a8-680cd47bc905" />

### Step 12

Authorise all the permissions (all of the code is non-malicious and completely safe), including multi-factor authentification if asked. I have used this script for years, and there is no security concern.

### Step 13

Make sure that there is nothing in the 'Email Sent' column. **Note that you can only send 100 emails in this manner per day using free Gmail**

When the following screen pops up, add the subject line there and run it:
<img width="709" height="340" alt="Screenshot from 2025-11-20 23-56-26" src="https://github.com/user-attachments/assets/e8d700da-7852-444e-ad3a-f8f64e86b3a1" />

Once the script starts running, **DO NOT** write or edit the sheet in any way until the script runs completely.

Cross-check if the emails have gone by checking your 'Sent' folder. The 'Email Sent' column will now be populated by the date when it was sent (the current date).


[1]: https://cran.rstudio.com/
[2]: https://posit.co/download/rstudio-desktop/
[3]: https://github.com/paulvpop/automated-multi-certificate-generation-and-email-sending/blob/main/R_script_for_automated_multi_certificate_generation.R
[4]: https://docs.google.com/spreadsheets/d/1ef2fK6pnlln8ad-JIGuaF3_u58qQmuwpNlmpqssBg8A/edit?usp=sharing
[5]: https://github.com/paulvpop/automated-multi-certificate-generation-and-email-sending/blob/main/modified_mail_merge_script.js
