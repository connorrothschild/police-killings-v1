library(tidyverse)
# clean

# data <- readxl::read_excel("../../data/uncleaned_ARCHIVE.xlsx")

library(RCurl)
url <- "https://mappingpoliceviolence.org/s/MPVDatasetDownload.xlsx"
download.file(url, destfile = "../../data/uncleaned_data.xlsx")

data <- readxl::read_excel("../../data/uncleaned_data.xlsx")

data <- data %>% 
  rename("Date" = `Date of Incident (month/day/year)`,
         "Link" = `Link to news article or photo of official document`,
         "Armed Status" = `Unarmed`, 
         "Age" = `Victim's age` , 
         "Race" = `Victim's race`, 
         "Sex" = `Victim's gender`, 
         "Image" = `URL of image of victim`, 
         "Name" = `Victim's name`) %>% 
  mutate(Zipcode = as.character(Zipcode),
         `Body Camera (Source: WaPo)` = as.logical(`Body Camera (Source: WaPo)`),
         `WaPo ID (If included in WaPo database)` = as.logical(`WaPo ID (If included in WaPo database)`)) %>% 
  arrange(Date)

clean_data <- data %>% 
  mutate(Year = lubridate::year(Date),
         `Agencies responsible for death` = `Agency responsible for death`,
         `Agency responsible for death` = str_replace(`Agency responsible for death`, ",.*",""),
         `Agency responsible for death` = paste0(`Agency responsible for death`, " (", State, ")"),
         `Cause of death` = str_replace(`Cause of death`, ",.*",""),
         Race = str_to_title(Race),
         `Cause of death` = str_to_title(`Cause of death`),
         `Symptoms of mental illness?` = str_to_title(`Symptoms of mental illness?`),
         ID = row_number())

write.csv(clean_data, "../../data/cleaned_data.csv")

# should be 75
# clean_data %>% filter(`Agency responsible for death` == "New York Police Department (NY)")
