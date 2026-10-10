# 🇰🇪 Kenya Agricultural Yield & Maize Price Forecasting Engine

An enterprise-grade, end-to-end Data Science and Engineering platform built to model, analyze, and forecast maize market price dynamics and agricultural yield variations across Kenya.

---

## 📌 Project Overview
Agriculture is the backbone of Kenya's economy, with maize serving as the primary dietary staple for millions of households. However, retail prices fluctuate unpredictably due to erratic rainfall, seasonal weather anomalies, and regional supply chain bottlenecks. 

This project solves that challenge by building an automated, end-to-end data platform that tracks, cleans, stores, analyzes, and forecasts maize market prices and agricultural conditions across Kenya's key agricultural hubs and consumer centers.

---

## 🚀 What This Project Does
* **Automates Data Collection:** Scrapes public agricultural market bulletins and weather reports using robust Python scripts.
* **Cleans & Sanitizes Data:** Handles messy real-world text, fixes irregular date formats, strips currency markers, and removes outliers to ensure trustworthy data.
* **Stores in a Relational Database:** Organizes counties, weather records, and retail prices into a normalized MySQL database with strict primary and foreign key constraints.
* **Performs Advanced SQL Analytics:** Uses complex joins, CTEs, and window functions to uncover price velocity and regional disparities between production hubs (like Eldoret and Kitale) and consumer markets (like Nairobi).
* **Engineers Time-Series Features:** Builds lag variables and rolling averages to capture multi-month weather impacts on crop pricing.
* **Trains Machine Learning Models:** Predicts future price trends and yield variations using robust regression and forecasting algorithms.
* **Deploys an Interactive Dashboard:** Serves all insights through a professional, user-friendly Streamlit web application complete with dynamic charts and filters.

## ⚠️ The Problem Statement

Maize is the lifeblood of Kenya's food security and agricultural economy, consumed daily by millions of households. However, the agricultural and retail ecosystem suffers from severe, persistent structural inefficiencies:

1. **Extreme Price Volatility:** Retail prices for a 90kg bag of dry maize swing wildly between surplus harvest seasons and lean periods, exposing urban and rural households to sudden cost-of-living shocks.
2. **Climate & Weather Vulnerability:** Rain-fed agriculture across key breadbasket regions (such as Uasin Gishu, Trans-Nzoia, and Nakuru) remains highly susceptible to erratic rainfall patterns, prolonged droughts, and unseasonal weather anomalies.
3. **Data Fragmentation & Inaccessibility:** Agricultural bulletins, commodity pricing reports, and meteorological data are scattered across isolated public portals, often published in messy, unstructured formats (PDFs, raw tables) that are difficult for farmers, traders, and policy-makers to analyze in real time.
4. **The Lack of Predictive Intelligence:** Existing agricultural tracking is largely reactive rather than proactive. Stakeholders lack localized, data-driven forecasting tools to predict price spikes or yield shortages months before they happen.

---
# 📋 Research & Business Questions

* **Q1:** How have maize prices changed across Kenyan markets over time?
* **Q2:** Which counties/regions experience the largest price volatility?
* **Q3:** How are rainfall and temperature associated with maize production/yields?
* **Q4:** Do weather conditions from previous months help predict maize prices?
* **Q5:** Can we forecast maize prices 1, 3 or 6 months ahead?
* **Q6:** Can agricultural/weather variables improve yield predictions compared with historical-yield-only baselines?
* **Q7:** Which variables contribute most to the forecasts?
* **Q8:** Would this specific information actually be available at the exact time I am making the forecast?
* **Q9:** Where does the model fail?
* **Q10:** What happens to the forecast if rainfall is 15% below historical average?


## 🎯 The Solution & Impact
The **KENYA_AGRICULTURAL_YIELD_AND_MAIZE_PRICE_FORECASTING_ENGINE** bridges this gap by transforming chaotic, raw multi-source data into a centralized, automated intelligence platform. By combining robust relational data storage, advanced time-series feature engineering, machine learning regression models, and an interactive Streamlit dashboard, this project delivers actionable foresight to stabilize markets, guide agricultural planning, and empower data-driven policy making.



### Step 1: Advanced HTTP Requests & Session Management
Before we can analyze or forecast anything, we have to collect the data. Public agricultural portals often block automated scripts or bots. To bypass this, we built a robust Python script utilizing persistent sessions and custom browser headers (`User-Agent`) to camouflage our requests, making them look like a human browsing via Google Chrome on a desktop.

When executed, the script successfully connected to the target agricultural portal (`https://keep.kalro.org/market`), bypassing bot filters and returning a clean **Status Code: 200 (Success)** with the raw HTML response preview ready for parsing.

*Execution Proof & Status Code Verification:*
![Step 1 Execution Success](Screenshot%20(272).png)

# Phase 2: Data Validation & Cleaning Engine
##  Part One: Exploratory Data Inspection (The "View")

**Executive Summary:** Before making any changes or cleaning our data, our engineering process requires taking a careful "first look" at the raw information. Jumping straight into cleaning without inspecting the data first is risky because it can hide hidden errors or structural problems. 

Below is the visual walkthrough and breakdown of our raw maize market price data before any cleaning takes place.

---

### 1. First Look at the Raw Data
We loaded our raw dataset (`raw_maize_market_prices.csv`) to check the column names, dates, and sample values[cite: 1].

![First 5 Rows of Raw Prices Data](Screenshot%20(274).png)

**What this shows us:**
* **Dates:** The dates are recorded as plain text strings (`YYYY-MM-DD`).
* **Price Formatting:** Some prices are clean numbers (like `4926`), while others include text formatting (like `KES 3,930`), which means we need to write a rule to clean them up.
* **Missing Data:** We can already spot missing values (`NaN`) in the retail price and supply volume columns.

---

### 2. Dataset Structure & Missing Data Check
Next, we ran a structural check using Python to see the total row count and check which columns have missing data[cite: 2].

![Data Information and Null Counts](Screenshot%20(275).png)

**Key Takeaways for Management:**
* **Total Volume:** We are working with a solid baseline of exactly 1,130 records[cite: 2].
* **Data Completeness:** While core information like dates, counties, markets, and wholesale prices are 100% complete (1,130 non-null rows), secondary columns like retail prices (1,077 rows) and supply volumes (1,042 rows) have missing records that our cleaning pipeline will handle[cite: 2].

---

### 3. Exact Missing Value Breakdown
To be completely transparent and audit-ready, we calculated the exact number of missing entries for every single column[cite: 3].

![Exact Missing Values per Column](Screenshot%20(276).png)

**Audit Findings:**
* **Core Info:** `0` missing values for dates, locations, and wholesale prices[cite: 3].
* **Gaps Found:** `53` missing entries in retail prices and `88` missing entries in supply volumes[cite: 3]. Quantifying these gaps allows us to track data quality accurately.

---

### 4. Spotting Messy Text Entries (Unit Variations)
Finally, we checked how market units are written across different reports[cite: 4].

![Unique Units in Raw Data](Screenshot%20(277).png)

**The Problem & Solution:**
* Market reporters typed weights in different ways: `['90kg bag', '90-kg bag', 'Bag (90kg)', '90 kg']`[cite: 4]. 
* **Action Plan:** If left uncorrected, a computer would treat these as four different items. Our upcoming cleaning script automatically standardizes all of them into a single uniform format (`90kg bag`) to ensure accurate price comparisons.


## 5: Automated Data-Quality & Pipeline Execution Output

After establishing our exploratory baseline and writing our data transformation pipeline, we executed the script to validate, clean, and export our agricultural market price records. 

Below is the live terminal execution showing our automated data-quality report, missing-value percentages, and geographic coverage summary.

---

### 1. Terminal Execution & Automated Quality Report
The screenshot below captures the successful execution of our cleaning script inside VS Code, displaying the final metrics of our validated dataset (`data/clean/clean_maize_market_prices.csv`)[cite: 5].

![Automated Data Quality Report Output](Screenshot%20(278).png)

**Key Operational Takeaways:**
* **Temporal Scope:** Successfully processed and verified a robust time-series ranging from **2024-01-01 to 2026-08-31**[cite: 5].
* **Spatial Reach:** Confirmed coverage across **6 Counties and 7 Markets**[cite: 5], ensuring our downstream forecasting models have a geographically diverse dataset.
* **Pipeline Integrity:** The script successfully handled missing values, standardized text inputs, stripped currency anomalies, and safely exported a clean, production-ready dataset[cite: 5].

---

### 2. Why This Step Matters for Management
By automating our data quality checks and generating this report programmatically, we ensure that:
1. **Zero Corrupt Data Enters Models:** Extreme outliers or malformed strings are caught and filtered out before predictive modeling begins.
2. **Full Auditability:** Every missing data point, duplicate record, and formatting fix is accounted for, providing complete transparency for stakeholders.
3. **Reproducibility:** Anyone on the team can run this script on fresh raw data drops and instantly obtain clean, standardized outputs.

---

# 6: Exploratory Data Visualization & Impact Analysis

**Executive Storytelling for Technical Portfolios:**
In professional data engineering and predictive modeling, building a model is only 20% of the job—the other 80% is rigorous data quality assurance. Unchecked outliers, skewed distributions, and unmanaged missing data can permanently compromise forecasting accuracy. 

Below is our visual audit story demonstrating how we inspected, quantified, and validated our agricultural market price feeds prior to database loading.

---

### 1. Visualizing Outlier Removal Impact (Boxplot Analysis)
To ensure that extreme pricing errors (typos or erroneous bulletin entries) do not distort our future machine learning models, we analyzed the statistical spread of wholesale prices before and after cleaning[cite: 6].

![Price Distribution Before vs After Outlier Removal](output%201.png)

**The Engineering Narrative:**
* **Before Cleaning (Left Boxplot):** Displays the raw price distribution[cite: 6]. While the interquartile range is stable, raw feeds in agricultural markets frequently contain extreme data-entry spikes or anomalies that stretch distribution tails.
* **After Cleaning (Right Boxplot):** Shows the pristine distribution after applying our strict business logic bounds (filtering out unrealistic prices below KES 1,500 and above KES 10,000 per 90kg bag)[cite: 6]. 
* **The Takeaway:** Our automated filter safely eliminates corrupted spikes while preserving the natural variance and median integrity of legitimate Kenyan market pricing.

---

### 2. Quantifying Initial Data Gaps (Missing Value Bar Chart)
Transparency in data science requires auditing data completeness. We programmed a dynamic check to calculate the exact percentage of missing entries across our core feature columns[cite: 7].

![Initial Missing Values Percentage by Column](output%202.png)

**The Engineering Narrative:**
* **Wholesale Price Completeness:** Achieved a flawless **0.0%** missing rate, ensuring our core target variable has complete historical coverage[cite: 7].
* **Secondary Metrics:** Retail prices showed a minimal **4.7%** gap, while supply volumes recorded a **7.8%** missing rate[cite: 7]. 
* **The Strategic Value:** Rather than blindly dropping valuable rows, quantifying these gaps precisely allows us to choose appropriate imputation strategies (such as rolling averages or seasonal interpolation) during downstream feature engineering without introducing artificial bias.

