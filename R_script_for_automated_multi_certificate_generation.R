#This script is partially based on 
#https://rstudio-pubs-static.s3.amazonaws.com/787980_1f8c91a8354c476797e9bb4173791b76.html

#Install these necessary packages and load them using the following commands:
if(!require(BiocManager)) {install.packages("BiocManager",
                                            dependencies = T)}

if(!require(EBImage)) {BiocManager::install("EBImage")}

#Set the working directory (ctrl+shift+h or copy paste the directory name inside the
#quotes below) to the directory containing the sample template(s)
setwd("/home/paul/event_name")

#Check if the directory has been correctly set
getwd()

# Read the template certificate(s) file form local machine to R environment
readImage("certificate_template.png") -> template

#OR
#readImage("participation.png") -> part
#readImage("finalist.png") -> final
#readImage("first.png") -> first
#readImage("second.png") -> second
#readImage("third.png") -> third

#template^2 -> template   
#uncomment the above(remove hash) and increase contrast (use only if needed)
display(template)   # View the template

#Load in the csv containing the participant names and emails
data <- read.csv("participants.csv")
#Remove white spaces from this data
data <- data.frame(lapply(data, trimws), stringsAsFactors = FALSE)  

#Testing for one certificate - you can check whether the alignment of names in the
#certificate is alright and adjust the x and y values accordingly. You can also
#change the font colour from black to something else, change the font family etc:

#Load the dplyr package for the pipe operator (%>%):
library(dplyr)

#Test for one certificate (with the first name in your data dataframe):
display(part, method= "raster") %>%
  text(x=  1158, y= 1072,
       label= paste(data$name[1]),
       cex=  0.9,
       col= "black",
       font= 1,
       family= "Ubuntu")

# If you click on 'Zoom' on the Plots panel on the bottom right, the text size of
# name will look small. Don't worry about it because when saving the file, it will
# large

#OPTIONAL:
#Test out the certificate generation for all participants and view the certificates 
#  in the Viewer panel
for(i in 1:nrow(data)) {
  display(part, method= "raster")
  text(x=  1158, y= 1072,
       label= paste(data$name[i]),
       cex=  0.9,
       col= "black",
       font= 1,
       family= "Ubuntu")}

#If you only have one template for every participant, for generating and saving 
#the individual certificates, use the following steps 
for(i in 1:nrow(data)) {
  png(paste0(data$name[i],".png"),
      width = 2245, height = 1587, res= 300)
  #use the same width and height (pixels) as the template
  display(part, method= "raster") 
  
  text(x=  1158, y= 1072,
       label= paste(data$name[i]),
       cex=  1,
       col= "black",
       font= 1,
       family= "Ubuntu")
  
  dev.off()
}

#If you have multiple templates for different participants for an event (for example,
# one for the people who came first, another for the people who came second, 
# and another for the people who participated), then use the following code for
#generating and saving individual certificates:
for(i in 1:nrow(data)) {
  png(paste0(data$name[i],".png"),
      width = 2245, height = 1587, res= 300)
  # use the same width and height (pixels) as the template. Make sure that the 
  # templates have the same resolution (width x height). Otherwise, this code 
  # need to be further modified
  
  # Select the appropriate certificate based on type
  certificate <- switch(data$type[i],
                        "prelims" = part,
                        "finalist" = final,
                        "first" = first,
                        "second" = second,
                        "third" = third)
  
  display(certificate, method= "raster") 
  
  text(x= 1158, y= 1072,
       label= paste(data$name[i]),
       cex= 1,
       col= "black",
       font= 1,
       family= "Ubuntu")
  
  dev.off()
}

# For the purpose of automated certificate sharing the attachment names need
# to be added as a column. So, save it as a column under the 'data' dataframe
# and save it
share_file <- data %>% 
  mutate(
    "Full Name" = name,
    "Recipient" = email,
    "Attachment" = paste0(name, ".png"),
    "Email Sent" = " ",
  ) %>%
  select(-c(name, email))

write.csv(share_file, "certificate_sharing_helper.csv")



