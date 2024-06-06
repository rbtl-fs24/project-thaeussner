library(tidyverse)
library(googlesheets4)

# import data from Google Sheets
raw_data_private <- read_sheet("https://docs.google.com/spreadsheets/d/1xdFW_hciiYMtzxY6r0nCTOOkwYAYz7synwAnyO0wFIw/edit#gid=350931651")
dictionary <- read_sheet("https://docs.google.com/spreadsheets/d/1sbEnCcIQwRlpGeICqkOFx7ZyH31O9SB3WR1n-TN7UYY/edit#gid=0")

# Remove columns with sensitive, non-anonymous data
raw_data <- raw_data_private |> 
  select(-c("Timestamp", 
            "Email address"))

# write raw data to csv and rds
write_rds(raw_data, "data/raw/raw_data.rds")
write_csv(raw_data, "data/raw/raw_data.csv")

# write the dictionary to csv
write_csv(dictionary, "data/processed/dictionary.csv")