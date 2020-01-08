library(tidyverse)
library(tidytext)
library(dplyr)
library(knitr)
library(DT)
source("word lists.R")
source("scraping.R")

#### Number of jobs #### 
nrow(job_data) %>%
  kable(row.names = FALSE, col.names = "Number of Jobs Analyzed",
        align = "l")


#### Prepare Tidy Text ####
tidy_jobs <- job_data %>% select(-job_body_html) %>% mutate(
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

#future: add links to list job_name, job_cat, job_file

#### Job Categories ####
job_data %>% select(job_cat) %>% 
  filter(str_count(job_cat, ' ') > 0) %>%
  group_by(job_cat) %>% count() %>%
  arrange(-n) %>%
  datatable(rownames = FALSE,
            colnames = c("Job Categories", "Count"),
            options = list(pageLength = 5))

#### Stats ####
job_stats <- tidy_jobs %>% inner_join(statistics)
job_stats %>% count(word) %>% arrange(-n) %>%
  rename("Statistics" = word) %>%
  kable(row.names = FALSE)

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

#### Search Job Ads ####
job_data_linkchar <- job_data %>% mutate(
  job_file = as.character(job_file))
  
job_link_id <- job_data_linkchar %>% mutate(
  link_id = substr(job_file, start=0, stop=nchar(job_file)-5))

job_data_with_links <- job_link_id %>% mutate(
  link = paste0(
    '<a href="https://www.higheredjobs.com/myHigherEdJobs/Agent/details.cfm?JobCode=',link_id,'" target="_blank">',job_name,'</a>')
  )

job_data_with_links %>% select(link, job_cat, job_body_html) %>%
  datatable(rownames = FALSE, escape = FALSE,
            colnames = c("Job", "Category", "Job Ad"),
            options = list(pageLength = 1, lengthChange = FALSE, searchHighlight = TRUE)) %>%
  formatStyle(c('link','job_cat'), `vertical-align` = 'top')
