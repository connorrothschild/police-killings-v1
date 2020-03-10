library(tidyverse)

data <- readr::read_csv("../../data/cleaned_data.csv")

# data %>% 
#   group_by(`Agency responsible for death`, State) %>% 
#   summarise(n()) %>% View()

data <- data %>% 
  mutate(`Agency responsible for death` = str_replace(`Agency responsible for death`, ",.*",""))

data <- data %>% 
  mutate(`Agency responsible for death` = paste0(`Agency responsible for death`, " (", State, ")"))

write.csv(data, "../../data/cleaned_data.csv")

departments <- data %>% 
  distinct(`Agency responsible for death`)

write.csv(departments, "../../data/department_data.csv")
