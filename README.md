
# Cylistic Bike Share Analysis

In this case study, we work for a fictional company, Cyclistic. It is a bike rental company that rents bikes across Chicago. We have been given data for the year 2018. With the data, it is our goal to answer certain business questions. This case study is a part of the Google Data Analytics Certificate.




## Introduction

Cyclistic runs a successful bike-share business. They have a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

They have two types of customers. 

1. Customers: who purchase single-ride or full-day passes

2. Subscribers: who purchase annual memberships

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, the Marketing Department believes that maximizing the number of annual members will be key to future growth.

**Business Goal:** Design marketing strategies aimed at converting casual riders into
annual members


## Business Questions

Three questions will guide the future marketing program:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members


## Data Source and Cleaning 

The data was acquired through the Google Analytics Course as part of course material. However, the original data was given to us in four files and with lots errors and junk.

**Data Cleaning Approach:**

1. Data was loaded into **power query**.

2. Orginal data for the year 2018 was given to us in four files with, one file for each quarter. Since the total combined rows exceeded the limits of Excel, data wasn't combined but each file was separately cleaned and loaded into their respective quarter version. 

3. The **result was 5 cleaned files** (one of the files was cleaned in two parts, because of too many rows), which were then **imported into the table created in Postgres SQL**.

*A more detailed description of steps undertaken during the cleaning can be found in the **Data Cleaning Steps.txt***


## Data Processing

Once cleaned, data was imported into a database created using Postgre SQL. Many queries were run for data exploration and finding trends. 

*The details and output of those queries can be found in the **bikes_sql_queries.sql** file and **bikes_sql_queries_output.xlsx***
## Summary of Analysis

The output of relevant queries was loaded into Excel and was analyzed using tables and graphs.

*The results of this analysis can be found in the **bikes_data_analysis.xlsx file*** 

Here are the top three key findings observed. 


1. The data shows that most of the rides are being taken in the middle of the year from June to October. These months comprise 65% of total yearly rides. **July, August, and June and the top three** where the ride count is the highest in their respective order. These top three months make up 43% of the total yearly rides.

2. **Customers are using bikes 2x longer than subscribers.** Customers, who don't have the membership tend to use and keep bikes for a longer duration than subscribers. It is safe to assume that customers on average keep bikes for more than a day, whereas subscribers keep them for over 12 hours. From this, we may be able to conclude that subscribers are using bikes on a day-to-day basis. 


3. **73% of our user base consists of Adults and Middle-Aged people.** It would be safe to assume that our user base consists of employed individuals who could be using these bikes as a form of commute to their work.

## Conclusion and Suggestions

This concludes our case study for Cyclistic bike share company. Through data, we were able to analyze trends in the usage of bikes and gather information about our user base. 

Based on the analysis and the business goal of converting more one-time customers into subscribers, here are two key suggestions. 

1. **Targeted Yearly Subscription Promotions in Peak Months:**

We can launch promotion campaigns or run discounts on yearly subscriptions in the peak months of June, July, and August. This is when almost 43% of all rides occur. 

2. **Tailor Marketing For Adults and Middle-Aged Riders:**

Almost 73% of total rides are taken by Adults (30-39) and Middle Aged People (40-49). We can tailor our marketing in such a way that is relatable to these age groups.
