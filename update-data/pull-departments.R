library(tidyverse)

# source('clean-data.R')

data <- readr::read_csv("../data/cleaned_data.csv")

departments <- data %>% 
  distinct(`Agency responsible for death`)

write.csv(departments, "../data/department_data.csv")
