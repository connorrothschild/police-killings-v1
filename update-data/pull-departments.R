library(tidyverse)

# source('clean-data.R')

data <- readr::read_csv(here::here("data/cleaned_data.csv"))

departments <- data %>% 
  distinct(`Agency responsible for death`)

write.csv(departments, here::here("data/department_data.csv"))
