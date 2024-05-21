library(tidyverse)

raw_data <- read_rds(here::here("data/raw/raw_data.rds"))

processed_data <- raw_data |> 
  # delete unused columns
  select(-c("Why? And what else would need to change?",
            "The data collected will be used anonymously for a published report as part of the course. If you want to be sent the report in June, you can enter your e-mail address at the end of the survey.")) |> 
  # rename columns to keep
  rename("age" = "Age",
         "position" = "Current study program or position",
         "field" = "Current field of study / work",
         "institution" = "Current institution",
         "importance_recycling" = "How would you rate the importance of recycling in general?",
         "importance_waste_reduction" = "How would you rate the importance of waste reduction in general?",
         "singleusecup_frequency" = "How often do you buy drinks (coffee, tea, etc) in single-use cups on campus?",
         "singleusecup_reason" = "What is your main reason for using single-use cups?",
         "singleusecup_ban_support" = "Would you support a campus-wide ban on single-use cups at cafes, kiosks, cafeterias etc?",
         "singleusecup_ban_impact" = "How would such a campus-wide ban on single-use cups impact your daily life?",
         "further_thoughts" = "Here you can share further thoughts, opinions or elaborate on something if you want:",
         "multiusecup_deposit" = "How high do you think a deposit on multi-use cups would need to be in order for them not to be thrown away?",
         "options_bring_own_cup" = "What options would need to be available at kiosks, cafeterias, etc? [The option to bring your own cup]",
         "options_multiusecup_small_deposit" = "What options would need to be available at kiosks, cafeterias, etc? [Multi-use cups with a small depot (< 5 Fr.)]",
         "options_multiusecup_large_deposit" = "What options would need to be available at kiosks, cafeterias, etc? [Multi-use cups with a large depot (> 5 Fr.)]",
         "options_multiusecup_to_buy" = "What options would need to be available at kiosks, cafeterias, etc? [Multi-use cups that you have to buy (> 10 Fr.)]",
         "options_sit_down" = "What options would need to be available at kiosks, cafeterias, etc? [The option to sit down with proper ceramic cups at no extra cost]",
         "options_none" = "What options would need to be available at kiosks, cafeterias, etc? [No options; you have to bring your own cup]",
         )

write_rds(processed_data, "data/processed/processed_data.rds")
write_csv(processed_data, "data/processed/processed_data.csv")
