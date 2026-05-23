CREATE DATABASE restaurant_db;
USE restaurant_db;

-- 1. Census table
CREATE TABLE census_data (
    postal_code VARCHAR(10) PRIMARY KEY,
    population INT,
    median_income INT,
    poverty_count INT,
    bachelor_degree INT,
    median_age DECIMAL(4,1)
);

-- 2. Yelp restaurants table
CREATE TABLE yelp_restaurants (
    restaurant_id INT PRIMARY KEY,
    business_id VARCHAR(50),
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(20),
    postal_code VARCHAR(10),
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    stars DECIMAL(3,1),
    review_count INT,
    price_range INT,
    is_open INT,
    is_michelin INT,
    walkscore INT,
    transit_score INT,
    bike_score INT
);

-- 3. Michelin restaurants table
CREATE TABLE michelin_restaurants (
    michelin_id INT PRIMARY KEY,
    name VARCHAR(255),
    postal_code VARCHAR(10),
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    price_level VARCHAR(10),
    cuisine VARCHAR(100),
    distinction VARCHAR(50),
    walkscore INT,
    transit_score INT,
    bike_score INT,
    CONSTRAINT fk_michelin_postal
        FOREIGN KEY (postal_code) REFERENCES census_data(postal_code)
);

-- 4. Michelin-Yelp match table
CREATE TABLE michelin_yelp_match (
    michelin_id INT PRIMARY KEY,
    restaurant_id INT NULL,
    business_id VARCHAR(50),
    yelp_name VARCHAR(255),
    match_status VARCHAR(20),
    CONSTRAINT fk_match_michelin
        FOREIGN KEY (michelin_id) REFERENCES michelin_restaurants(michelin_id),
    CONSTRAINT fk_match_yelp
        FOREIGN KEY (restaurant_id) REFERENCES yelp_restaurants(restaurant_id)
);