# Hackathon---Home-Field-Advantage

<img src="http://www.travelandsports.com.au/wp-content/uploads/2017/02/07_lsu0446-tiger-stadium-at-sundown-min.jpg" align="right"
     alt="Sold out Stadium" width="180" height="120">
     
UC Davis has partnered with Google for AggieHacks 2021, a competition focused around the analyzing the impacts of COVID-19. 
We focused on discerning the impact COVID has had on sports because of fans being limited at games and when sports teams should fully reopen their stadiums based on vaccination rates throughout the country.

## What is in the Repo

* Data Collection Tools
* Programs Focused on Statistical Analysis
* Visualizations



## Data Collection Tools

This Repo is split into 2 main parts - sports attendance and COVID vaccination predictions. 

### Sports Attendance
Data was used from https://sports-reference.com. It was obtained in several different ways. For hockey (NHL) and soccer (La Liga and Premier League), data was taken directly from the website and cleaned in excel. For baseball (MLB) and basketball (NBA), two different API's in python were used to gather the relevant data. Both of these API's leverage sports-reference.com, however note that the API for basketball only had average attendance for a given season, so generalizations were made to take the season averages to the individual game level (in our final dataset, for the 2020-2021 NBA season, we manually obtained each game's attendance, so the previous statement only applies to earlier seasons). The process for gathering data on American Football (NFL) was a little more tedious. Another API was used in Python that pulled data from another Github repo. This repo had data on NFL games from 2000-2019 and attendance numbers in 2 different files. These files were then downloaded and subsequently uploaded into a SQL database. The SQL file Hackathon_NFL_Query.sql was then used to join these two tables. For 2020 data (during COVID), the data was manually taken from sports-reference.com and joined in excel with the rest of the american football data. The file Hackathon.ipynb has the code for the different API's and also is where the different sports datasets were eventually combined. The master dataset with all of the data is called sports_data.csv and each individual sport also has its own csv.

### COVID Vaccination Predictions
The model used for prediction is ARIMA, based on the out-of-sample performance it turns out to be an average of 92% accuracy score. Depending on the states, the accuracy score of our ARIMA model can go has high as 98.69%. More detailed can be found at Sample-test-preidction.ipynb
<img width="1017" alt="Screen Shot 2021-04-20 at 11 44 17 AM" src="https://user-images.githubusercontent.com/74214249/115447971-f8d4df00-a1cd-11eb-9276-44b9ba945f61.png">

Data for COVID vaccinations was pulled from https://github.com/owid/covid-19-data/tree/master/public/data/vaccinations. This data was originally sourced from the CDC. State population data was taken from https://www.infoplease.com/us/states/state-population-by-rank.

## Programs Focused on Statistical Analysis

### Sports Attendance
The file Hackathon.ipynb (same one where data was collected) is where the statistical tests were done for sports team performance. These statistical tests checked whether teams were fairing worse at their home venues during COVID in part due to the lack of fans. The data was saved in our repo to a file called csvData.csv.

### COVID Vaccination Predictions
A python script called vaccination_prediction.ipynb used ARIMA to generate predictions on COVID vaccinations for several states. We focused on states with NBA teams as the NBA was the focus of our project. An interactive dashboard built in Google Data Studio can be found here: https://datastudio.google.com/s/rWABKN05Wng

## Reports
A Tableau file called Hackathon_Viz.twb contains several visualizations for different sports and their performances pre and during COVID. This program uses sports_data.csv as its data source.

### Usage
To get the most out of this repo, there are two routes: Follow the path we did in collecting the data and evaluating it or using the complete dataset (sports_data.csv) to evaluate to look for new interesting findings.

1. Following the path we took - The path we took started with evaluating a problem stemming COVID-19. We decided that seeing how sports teams have fared at their home venues during COVID would be a really interesting problem as it is a potentially once-in-a-lifetime natural experiment. Our next task was to decide what exact problems we hoped to answer with data analytics. We settled on:

* How has the lack of attendance brought on by COVID affected home team performance?
* When is the right time for teams to fully reopen their venues?

Focusing on these two problems ties in our attempt as a country to get back to normal but not to do it in a unnecessarily risky fashion. We then looked for places to get data. For the vaccination data, there are plenty of sources and we used a Github Repo (linked above) that pulled data from the CDC. The sports data was a little trickier to get but using a combination of API's (in Hackathon.ipynb) and data directly from sports-referene.com, we obtained a usable dataset. With this dataset for sports, the next step was to use Tableau (Hackathon_Viz.twb) to learn how COVID has affected sports team performance. We saw that baseball was the only sport where teams actually did better at home with limited fans. Soccer had the biggest drop-off in performance and the other sports we analyzed (baseball, basketball, hockey, american football) all also saw drop-offs as was to be expected. We then settled on basketball as the NBA season is winding down and teams are trying to reopen their venues. To validate our findings with statistical analysis, we used the same Python script (Hackathon.ipynb) to find the statistical difference in sports league performance before and during COVID. 
For finding when it would be safe for teams to reopen their stadiums, we used the NBA again as our focus and used vaccination data (csvData.csv) to predict when different states would reach herd immunity. We settled on a 60% vaccination rate as along with people being naturally immune, it would fall in line CDC estimates for herd immunity. Using the ARIMA technique in the Python script (vaccination_prediction.ipynb), we made predictions for the states with NBA teams. We then used Google Data Studio to make some visualizations with these findings.

2. Look for new and interesting findings - For those that want to do some exploration on this topic, the dataset we collected (sports_data.csv) is fairly comprehensive with years of data from major sports. Using visualization tools like Tableau is a great way to make new findings.
