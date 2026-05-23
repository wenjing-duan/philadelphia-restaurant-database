# Philadelphia Restaurant Database

## Overview
This project builds an integrated Philadelphia restaurant database using Yelp, Michelin Guide, U.S. Census, and Walk Score data. The goal is to combine fragmented restaurant, accessibility, and neighborhood signals into a structured MySQL database that supports restaurant benchmarking and location analysis.

## Business Problem
Restaurant investors, analysts, and operators often need to compare restaurants across multiple dimensions, including customer perception, premium dining recognition, neighborhood demographics, and location accessibility. However, these signals are usually spread across separate data sources.

This project addresses that gap by creating a decision-ready database for analyzing restaurant market positioning in Philadelphia.

## Data Sources
- Yelp Open Dataset: restaurant attributes, ratings, review counts, price range, and operating status
- Michelin Guide: premium dining recognition, cuisine type, and price level
- U.S. Census API: ZIP-code-level demographic variables such as population, median income, poverty count, education level, and median age
- Walk Score API: walkability, transit, and bike accessibility scores

## Tools
- MySQL
- SQL
- Python
- pandas
- API Requests
- Web Scraping
- Regular Expressions
- Data Cleaning

## Repository Files
- `philadelphia_restaurant_database.ipynb`: Python workflow for data collection, cleaning, API requests, matching logic, and database preparation
- `schema.sql`: MySQL schema for the restaurant database
- `analysis_queries.sql`: SQL queries used for business analysis
- `restaurant_database_report.pdf`: Polished final project report

## Database Design
The database contains four main tables:

- `yelp_restaurants`
- `michelin_restaurants`
- `census_data`
- `michelin_yelp_match`

A bridge table was created to connect Yelp and Michelin restaurant records because the two datasets do not share a common key. Accessibility variables from Walk Score were embedded at the restaurant level to support direct comparison across restaurants.

## Key Analyses
### 1. Michelin vs Non-Michelin Yelp Performance
Compared average Yelp rating, review count, and price range between Michelin-matched and non-Michelin restaurants.

### 2. Accessibility Comparison
Compared Walk Score, Transit Score, and Bike Score between Michelin and non-Michelin restaurants.

### 3. Neighborhood Comparison
Joined restaurant records with Census data to compare median income, poverty count, education level, and median age across restaurant groups.

## Key Findings
- Michelin restaurants showed higher average Yelp ratings, review counts, and price ranges compared with non-Michelin restaurants.
- Michelin restaurants were generally located in areas with stronger walkability, transit access, and bike accessibility.
- Michelin restaurants were associated with neighborhoods that had higher median income, higher education levels, and lower poverty counts.

## Project Work
This project covers the full database development workflow, including data collection, cleaning, schema design, SQL implementation, and business analysis.

Key work completed in this project includes:

- Collected Walk Score data through API requests
- Cleaned and prepared restaurant-level datasets
- Designed and created MySQL tables for Yelp, Michelin, Census, and matching data
- Built matching logic to connect Michelin and Yelp restaurant records
- Wrote SQL queries to compare Michelin and non-Michelin restaurant groups
- Analyzed accessibility, neighborhood income, education level, and premium dining location patterns
- Summarized business insights in the final project report

## Business Value
This project demonstrates how SQL database design and multi-source data integration can support restaurant benchmarking, premium dining analysis, and location strategy. The database can help analysts and business stakeholders identify factors associated with stronger restaurant market positioning.
