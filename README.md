README
================

## Purpose

The purpose of this project is to understand the skills and competencies
of jobs potential ESM graduates may be qualified for.

## Data

All data comes from [HigherEdJobs](http://www.higheredjobs.com). Due to
webscraping limitations (the webscraper is denied as a bot), jobs were
manually downloaded from an advanced search ( [click here to use the
search](https://www.higheredjobs.com/search/advanced_action.cfm?JobCat=14&JobCat=212&JobCat=148&JobCat=27&JobCat=31&JobCat=43&PosType=1&PosType=2&InstType=1&InstType=2&InstType=3&Keyword=quantitative+OR+statistics+OR+measurement+OR+data&Remote=1&Remote=2&Region=&Submit=Search+Jobs)
).

## Code

The content of the files is scraped using the *rvest* package. The code
can be found in the **scraping.R** file.

The code is then analyzed using *tidytext*.

## Some basic findings

| Number of Jobs Analyzed |
| ----------------------: |
|                      30 |

| Platform  |  n |
| :-------- | -: |
| excel     | 18 |
| cognos    | 15 |
| sql       | 15 |
| tableau   | 15 |
| database  | 12 |
| spss      | 10 |
| sas       |  9 |
| r         |  6 |
| oracle    |  4 |
| python    |  4 |
| warehouse |  4 |
| powerbi   |  3 |
| cluster   |  1 |
| matlab    |  1 |
| minitab   |  1 |
| qlik      |  1 |
| scala     |  1 |
| stata     |  1 |

| Statistics  | n |
| :---------- | -: |
| inferential | 4 |
| descriptive | 3 |
| projections | 2 |
| regression  | 2 |
| anova       | 1 |
| correlation | 1 |
| factor      | 1 |
| forecasts   | 1 |
| logistic    | 1 |
| pca         | 1 |
