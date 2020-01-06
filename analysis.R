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

#### Languages ####
job_langs <- tidy_jobs %>% inner_join(langs)
job_langs %>% count(word) %>% arrange(-n) %>%
  rename("Platform" = word) %>%
  kable(row.names = FALSE)

job_stats <- tidy_jobs %>% inner_join(statistics)
job_stats %>% count(word) %>% arrange(-n) %>%
  rename("Statistics" = word) %>%
  kable(row.names = FALSE)
