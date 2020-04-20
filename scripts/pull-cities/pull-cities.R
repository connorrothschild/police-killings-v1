library(tidyverse)

data <- readr::read_csv("../../data/cleaned_data.csv")

cities <- data %>% 
  mutate(CityState = paste0(City, ", ", State)) %>%  
  distinct(City, State, CityState)

write.csv(cities, "../../data/city_data.csv")
