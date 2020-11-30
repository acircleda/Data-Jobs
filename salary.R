library(tidyverse)
library(tidytext)
load("job_db.RData")
library(priceR)

tmp <- extract_salary(job_data$job_body, salary_range_handling = "min")

#### Prepare Tidy Text ####
tidy_jobs <- job_data %>% filter(word(job_cat, 1) == "Admin") %>% select(-job_body_html) %>% mutate(
  content = as.character(job_body))

tidy_jobs <- tidy_jobs %>% unnest_tokens(word, content) 
tidy_jobs <- tidy_jobs %>%
  anti_join(stop_words_r) %>%  #remove common words to reduce size
  distinct(word, job_file, .keep_all = TRUE) 

#### Salary ####
tj1 <- tidy_jobs %>% unnest_tokens(word, content, strip_punct = FALSE) #keeps punctiation

tj2 <- tj1 %>% mutate(
  sal1 = lead(word, n=1)) #brings next row next to previous to help connect salary with $

tj3 <- tj2 %>% filter(word == "$" & nchar(sal1) > 4) %>% 
  mutate(
    #grabs only $ with numbers in the thousands, removes any leftover words
  salclean = as.numeric(gsub("[^0-9.-]", "", sal1)),
    #any monthly salaries are transfromed into yearly salaries
  yearly = ifelse((nchar(salclean) < 5), salclean*12, salclean)) 

# #creates a salary
# tj4 <- tj3 %>% mutate(
#   salary = paste0(word,salclean)
# ) 

#creates a range
salary <- tj3 %>%
  group_by(job_file, job_name, job_inst, job_cat, job_posted_date,
           job_type, job_body) %>%
  summarize(mean = mean(yearly))

#average per job cat
salary %>% group_by(job_cat) %>%
  summarize(mean = mean(mean))

# to do:

#per job name
#per 

#next step - round numbers, keep only yearly salaries, unnest_tokens again, combine with word lists combine word lists with salary range, compute average begin and average end for each language

# #test using dictionary ----
# job_stats <- tidy_jobs %>% inner_join(statistics) %>%
#   left_join(stats_dict, by = c('word' = 'value')) %>%
#   mutate(term = coalesce(cat, word))
#
# job_stats %>% count(term) %>% arrange(-n) %>%
#   rename("Statistics" = term) %>%
#   kable(row.names = FALSE)