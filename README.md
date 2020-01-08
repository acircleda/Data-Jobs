Data-Related Jobs for ESM Graduates
================

## Purpose

The purpose of this project is to understand the skills and competencies
of jobs potential ESM graduates may be qualified for.

## Data and Methodology

All data comes from [HigherEdJobs](http://www.higheredjobs.com) using
the following
    searchers

  - [Search 1](https://www.higheredjobs.com/search/advanced_action.cfm?JobCat=14&JobCat=212&JobCat=148&JobCat=27&JobCat=31&JobCat=43&PosType=1&PosType=2&InstType=1&InstType=2&InstType=3&Keyword=quantitative+OR+statistics+OR+measurement+OR+data&Remote=1&Remote=2&Region=&Submit=Search+Jobs)
  - [Search 2](https://www.higheredjobs.com/search/advanced_action.cfm?PosType=1&PosType=2&InstType=1&InstType=2&InstType=3&Keyword=%22data+scientist%22+OR+%22data+engineer%22+OR+%22data+analyst%22&Remote=1&Remote=2&Region=&Submit=Search+Jobs)

The initial plan was to use the *rvest* webscraper package to
automatically crawl these searches and scrape these jobs. However, while
testing, I realized only a limited amount of data could be downloaded
before the webscraper was blocked as a bot.

Due to webscraping limitations, jobs were manually downloaded from the
searches. This had the added advantage of “human filtering” - removing
jobs that were unrelated or clearly required discipline-specific degrees
(e.g. business, biostats).

All downloaded jobs can be found in the **job-files** directory.

## Code

The content of the files is scraped using the *rvest* package. The code
can be found in the **scraping.R** file. The code is then analyzed using
*tidytext* and words from the **word lists.R** file.

## Job Ad Data

| Number of Jobs Analyzed |
| ----------------------: |
|                      76 |

### Job Categories

![](README_files/figure-gfm/job_categories-1.png)<!-- -->

## Basic Findings

### Programming/Software

| Program/Language |  n |
| :--------------- | -: |
| excel            | 30 |
| sql              | 27 |
| database         | 26 |
| r                | 22 |
| tableau          | 22 |
| sas              | 21 |
| python           | 17 |
| spss             | 13 |
| cognos           | 10 |
| warehouse        | 10 |
| oracle           |  8 |
| stata            |  8 |
| powerbi          |  7 |
| scala            |  4 |
| vba              |  3 |
| java             |  2 |
| minitab          |  2 |
| arcgis           |  1 |
| dedoose          |  1 |
| html             |  1 |
| javascript       |  1 |
| matlab           |  1 |
| nvivo            |  1 |
| qlik             |  1 |

### Statistical Skills

| Statistics   |  n |
| :----------- | -: |
| mining       | 10 |
| descriptive  |  4 |
| inferential  |  4 |
| forecasts    |  3 |
| regression   |  3 |
| factor       |  2 |
| logistic     |  2 |
| projections  |  2 |
| anova        |  1 |
| correlation  |  1 |
| correlations |  1 |
| hierarchical |  1 |
| pca          |  1 |

## Next Steps

To develop this project more, I plan to:

1.  Add more jobs
2.  Increase and refine already extant wordlists
3.  Create a “skills” wordlist
4.  Allow sorting by job type, location, etc.

<!-- end list -->

  - Maybe a Shiny app?
