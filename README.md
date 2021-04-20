# Hackathon---Home-Field-Advantage

<img src="http://www.travelandsports.com.au/wp-content/uploads/2017/02/07_lsu0446-tiger-stadium-at-sundown-min.jpg" align="right"
     alt="Sold out Stadium" width="180" height="120">
     
UC Davis has partnered with Google for AggieHacks 2021, a competition focused around the analyzing the impacts of COVID-19. 
We have focused on trying to discern the impact COVID has had on sports because of fans being limited at games and when sports teams should fully reopen their stadiums based on vaccination rates throughout the country.

## What is in the Repo

* Data Collection Tools
* Programs Focused on Statistical Analysis
* Visualizations



## Data Collection Tools

This Repo is split into 2 main parts - sports attendance and COVID vaccination predictions. 

### Sports Attendance, 
Data was used from sports-reference.com. It was obtained in several different ways. For hockey (NHL) and soccer (La Liga and Premier League), data was taken directly from the website and cleaned in excel. For baseball (MLB) and basketball (NBA), two different API's in python were used to gather the relevant data. Both of these API's leverage sports-reference.com, however note that the API for basketball only had average attendance for a given season, so generalizations were made to take the season averages to the individual game level (in our final dataset, for the 2020-2021 NBA season, we manually obtained each game's attendance, so the previous statement only applies to earlier seasons). The process for gathering data on American Football (NFL) was a little more tedious. Another API was used in Python that pulled data from another Github repo. This repo had data on NFL games from 2000-2019 and attendance numbers in 2 different files. These files were then downloaded and subsequently uploaded into a SQL database. The SQL file Hackathon_NFL_Query.sql was then used to join these two tables. For 202 data (during COVID), the data was manually taken from sports-reference.com and joined in excel with the rest of the american football data. The file Hackathon.ipynb has the code for the different API's and also is where the different sports datasets were eventually combined. The master dataset with all of the data is called sports_data.csv and each individual sport also has its own csv.

### COVID Vaccination Predictions
Data for COVID vaccinations was pulled from https://github.com/owid/covid-19-data/tree/master/public/data/vaccinations. This data was originally sourced from the CDC. State population data was taken from https://www.infoplease.com/us/states/state-population-by-rank.

## Programs Focused on Statistical Analysis

### Sports Attendance, 
The file Hackathon.ipynb (same one where data was collected) is where the statistical tests were done for sports team performance. These statistical tests checked whether teams were fairing worse at their home venues during COVID in part due to the lack of fans. The data was saved in our repo to a file called csvData.csv.

### COVID Vaccination Predictions
A python script called vaccination_prediction.ipynb used ARIMA to genrate predictions on COVID vaccinations for several states. We focused on states with NBA teams as the NBA was the focus of our project.

## Reports

A Tableau file called Hackathon_Viz.twb contains several vizualizations for different sports and their performaces pre and during COVID. This program uses sports_data.csv as its data source.
