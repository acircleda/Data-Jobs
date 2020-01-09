library(tidyverse)

stop_words_r <- stop_words %>% filter(word != "r")

#### Programming Languages ####
langs <- tibble(word = c('actuate',
                         'alpine',
                         'alteryx',
                         'angoss',
                         'apache',
                         'bmdp',
                         'c++',
                         'c#',
                         'caffe',
                         'cognos',
                         'datarobot',
                         'fico',
                         'fortran',
                         'h2o',
                         'hadoop',
                         'java',
                         'jmp',
                         'julia',
                         'knime',
                         'lavastorm',
                         'matlab',
                         'excel',
                         'minitab',
                         'ncss',
                         'oracle',
                         'powerbi',
                         'prognoz',
                         'python',
                         'qlik',
                         'r',
                         'r,',
                         ' r',
                         'r ',
                         'rapidminer',
                         'salfordspm',
                         'sap',
                         'sas',
                         'scala',
                         'spotfire',
                         'spss',
                         'sql',
                         'stata',
                         'statgraphics',
                         'statistica',
                         'systat',
                         'tableau',
                         'tensorflow',
                         'teradata',
                         'xgboost',
                         'warehouse',
                         'database',
                         'mplus',
                         'github',
                         'git',
                         'html',
                         'php',
                         'css',
                         'javascript',
                         'arcgis',
                         'nvivo',
                         'dedoose',
                         'vba',
                         'qualtrics',
                         'salesforce'
                         
))

#### Statistical Methods ####
statistics <- tibble(word = c(
  'regression',
  'logistic',
  'anova',
  'projection',
  'projections',
  'forecast',
  'forecasts',
  'correlation',
  'descriptive',
  'descriptives',
  'inferential',
  'correlations',
  'irt',
  'factor',
  'fa',
  'pca',
  'cfa',
  'efa',
  'longitudinal ',
  'sem',
  'mlm',
  'hierarchical',
  'multilevel',
  'structural',
  'time-series',
  'mining'
))

#### Other Skills ####
skills <- tibble(word = c(
  'visualization',
  'qualitative',
  'statistics',
  'survey',
  'questionnaire',
  'cleaning',
  'wrangling',
  'presentation',
  'graph',
  'graphs',
  'dashboard',
  'dashboards',
  'warehouse',
  'report',
  'reporting',
  'presentation',
  'presentations'
))

#### Databases ####
databases <- tibble(word = c(
  'ipeds',
  'timms',
  'pisa',
  'nces',
  'b&b',
  'bps',
  'peoplesoft',
  'banner',
  'workday'
))

#### Job Titles ####
job_title_list <- tibble(word = c(
  'Data Scientist',
  'Data Analyst'
))