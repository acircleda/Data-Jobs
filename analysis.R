library(tidyverse)
library(tidytext)
library(dplyr)
library(knitr)
source("word lists.R")

#### Number of jobs #### 
nrow(job_data) %>%
  kable(row.names = FALSE, col.names = "Number of Jobs Analyzed")


#### Prepare Tidy Text ####
tidy_jobs <- job_data %>% mutate(
  content = as.character(job_body))


tidy_jobs <- tidy_jobs %>% unnest_tokens(word, content) 
tidy_jobs <- tidy_jobs %>%
  anti_join(stop_words) %>%  #remove common words to reduce size
  distinct(word, job_file, .keep_all = TRUE) #remove duplicates per job

#### Languages ####
job_langs <- tidy_jobs %>% inner_join(langs)
job_langs %>% count(word) %>% arrange(-n) %>%
  rename("Platform/Program/Language" = word) %>%
  kable(row.names = FALSE)

#### Stats ####
job_stats <- tidy_jobs %>% inner_join(statistics)
job_stats %>% count(word) %>% arrange(-n) %>%
  rename("Statistics" = word) %>%
  kable(row.names = FALSE)
