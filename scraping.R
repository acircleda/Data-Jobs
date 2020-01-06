library(tidyverse)
library(rvest)
# ####get initial search results#####
# search_results <- read_html("https://www.higheredjobs.com/search/advanced_action.cfm?JobCat=141&JobCat=14&JobCat=212&JobCat=18&JobCat=148&JobCat=31&JobCat=43&PosType=1&InstType=1&InstType=2&InstType=3&Keyword=&Remote=1&Remote=2&Region=&Submit=Search+Jobs")
# 
# get_job_links <- html_nodes(search_results,'.col-sm-7 a') %>% html_attr("href")
# 
# job_links <- tibble(get_job_links) %>% distinct() %>%
#   mutate(
#   url = paste0("https://www.higheredjobs.com/search/", get_job_links))
# 
# write.csv(job_links, "job_links.csv")

#### scrape jobs ####
#1. set empty data frame
job_data <- setNames(data.frame(matrix(ncol = 7, nrow = 0)), c("job_file", "job_name", "job_inst", "job_cat", "job_posted_date", "job_type", "job_body"))

#2. update internal job links
file_list <- data.frame(files = list.files("job-files"))

#3. scrape jobs
for(i in 1:nrow(file_list)) {
  job_file <- file_list$files[i]
  
  if (job_file %in% job_data$job_file == TRUE) {
    next
  }
  
  tmp_single_job <- read_html(paste0("job-files/",file_list$files[i]))
  
  # # id <- job_links$url[i] %>% 
  # #   substr(nchar("https://www.higheredjobs.com/search/details.cfm?JobCode=")+1, nchar("https://www.higheredjobs.com/search/details.cfm?JobCode=")+9)
  # 
  # # if (job_id %in% job_data$job_id == TRUE){
  # #   next
  # # }
  # 
  job_name <- tmp_single_job %>% html_nodes(xpath = '//*[@id="jobtitle-header"]') %>% html_text()
  job_inst <- tmp_single_job %>% html_nodes(xpath = '//*[@id="jobAttrib"]/div[2]/div[2]') %>% html_text()
  job_cat <- tmp_single_job %>% html_nodes(xpath = '//*[@id="jobAttrib"]/div[3]/div[2]/text()') %>% html_text()
  job_posted_date <- tmp_single_job %>% html_nodes(xpath = '//*[@id="jobAttrib"]/div[4]/div[2]') %>% html_text()
  job_type <- tmp_single_job %>% html_nodes(xpath = '//*[@id="jobAttrib"]/div[5]/div[2]') %>% html_text()
  job_body <- tmp_single_job %>% html_nodes(xpath = '//*[@id="jobDesc"]') %>% html_text()
  
  tmp_single_job_data <- data.frame(job_file, job_name, job_inst, job_cat, job_posted_date, job_type, job_body)
  
  job_data <- job_data %>% rbind(tmp_single_job_data)
  
}

job_data <- job_data %>% distinct(job_file, .keep_all = TRUE) #remove any duplicates

# #### scrape single page ####
# 
# single_job <- read_html("job-files/details (6).html") #job link
# 
# # job_id <- job_links$url[1] %>% 
# #   substr(nchar("https://www.higheredjobs.com/search/details.cfm?JobCode=")+1, nchar("https://www.higheredjobs.com/search/details.cfm?JobCode=")+9) #get job id
# # 
# # #job_id %in% job_data$job_id
# 
# job_name <- html_nodes(single_job,xpath='//*[@id="jobtitle-header"]') %>% html_text()
# job_inst <- single_job %>% html_nodes(xpath = '//*[@id="jobAttrib"]/div[2]/div[2]') %>% html_text()
# job_cat <- single_job %>% html_nodes(xpath = '//*[@id="jobAttrib"]/div[3]/div[2]/text()') %>% html_text()
# job_posted_date <- single_job %>% html_nodes(xpath = '//*[@id="jobAttrib"]/div[4]/div[2]') %>% html_text()
# job_type <- single_job %>% html_nodes(xpath = '//*[@id="jobAttrib"]/div[5]/div[2]') %>% html_text()
# job_body <- single_job %>% html_nodes(xpath = '//*[@id="jobDesc"]') %>% html_text()
# 
# single_job_data <- data.frame(job_name, job_inst, job_cat, job_posted_date, job_type, job_body)
# 
# job_data <- job_data %>% rbind(single_job_data)
