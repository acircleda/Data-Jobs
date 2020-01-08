library(tidyverse)
library(tidytext)
library(dplyr)
library(knitr)
library(DT)
source("word lists.R")
source("scraping.R")

#### Number of jobs #### 
nrow(job_data) %>%
  kable(row.names = FALSE, col.names = "Number of Jobs Analyzed")


#### Prepare Tidy Text ####
tidy_jobs <- job_data %>% mutate(
  content = as.character(job_body))


tidy_jobs <- tidy_jobs %>% unnest_tokens(word, content) 
tidy_jobs <- tidy_jobs %>%
  anti_join(stop_words_r) %>%  #remove common words to reduce size
  distinct(word, job_file, .keep_all = TRUE) #remove duplicates per job

#### Languages ####
job_langs <- tidy_jobs %>% inner_join(langs)
job_langs %>% count(word) %>% arrange(-n) %>%
  rename("Platform/Program/Language" = word) %>%
  kable(row.names = FALSE)

#add links to list job_name, job_cat, job_file

#### Job Categories ####
job_data %>% select(job_cat) %>% 
  filter(str_count(job_cat, ' ') > 0) %>%
  group_by(job_cat) %>% count() %>%
  arrange(-n) %>%
  datatable(rownames = FALSE,
            colnames = c("Job Categories", "Count"))

#### Stats ####
job_stats <- tidy_jobs %>% inner_join(statistics)
job_stats %>% count(word) %>% arrange(-n) %>%
  rename("Statistics" = word) %>%
  kable(row.names = FALSE)

tidy_jobs %>% select(word) %>% view()

#### Skills ####

#### Job Categories ####
job_data %>%
  filter(str_count(job_cat, ' ') > 0) %>%
  group_by(job_cat) %>% count() %>% 
  arrange(-n) %>% datatable(
    rownames = FALSE,
    colnames = c("Job Category", "Count"))
  
  #to do: add links to each job category - make list from HEJ

#### Job Names ####
job_data %>% group_by(job_name) %>% count() %>% 
  arrange(-n) %>% datatable()
  
#click to find links with those job names
#link to that page

#### Salaries ####