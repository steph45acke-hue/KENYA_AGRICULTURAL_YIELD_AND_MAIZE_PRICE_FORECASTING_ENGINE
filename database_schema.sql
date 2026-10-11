-- 1.creating the database
CREATE DATABASE IF NOT EXISTS kenya_maize_db;
USE kenya_maize_db;

-- 2.creating the counties table(the geographic root)
CREATE TABLE IF NOT EXISTS counties (
county_id INT AUTO_INCREMENT PRIMARY KEY,
county_name VARCHAR(100) NOT NULL UNIQUE
);

-- 3.creating the market table (child of counties)
CREATE TABLE IF NOT EXISTS markets (
market_id INT AUTO_INCREMENT PRIMARY KEY,
market_name VARCHAR(100) NOT NULL,
county_id INT NOT NULL,
CONSTRAINT  fk_market_county
FOREIGN KEY (county_id) REFERENCES counties(county_id)
ON DELETE CASCADE ON UPDATE CASCADE,
UNIQUE (market_name,county_id)
);

-- 4.data sources table(provenance tracking)
CREATE TABLE IF NOT EXISTS data_sources (
source_id INT AUTO_INCREMENT PRIMARY KEY,
source_name VARCHAR(150) NOT NULL UNIQUE,
source_description TEXT
);

-- 5.maize prices table(the core time series)
CREATE TABLE IF NOT EXISTS maize_prices (
price_id INT AUTO_INCREMENT PRIMARY KEY,
reporting_date DATE NOT NULL,
market_id INT NOT NULL,
source_id INT NOT NULL,
wholesale_price_cleaned DECIMAL(10,2) NOT NULL,
retail_price_per_kg DECIMAL(10,2),
supply_volume_tonnes DECIMAL(10,2),
standardized_unit VARCHAR(50) DEFAULT '90kg bag',
CREATED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT fk_price_market
FOREIGN KEY (market_id) REFERENCES data_sources(source_id)
ON DELETE RESTRICT ON UPDATE CASCADE,
INDEX idx_reporting_date (reporting_date),
INDEX idx_market_date (market_id,reporting_date)
);


