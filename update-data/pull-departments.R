library(tidyverse)

# source('clean-data.R')

data <- readr::read_csv(here::here("data/cleaned_data.csv"))

listed <- data %>% 
  select(`Agencies responsible for death`) %>% 
  mutate(all_agencies = as.list(strsplit(`Agencies responsible for death`, ", ")))

long <- tidyr::unnest(listed, all_agencies) %>% 
  filter(complete.cases(.))

departments <- long %>% 
  distinct(all_agencies)

write.csv(departments, here::here("data/department_data.csv"))
