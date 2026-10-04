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

## 🎯 The Solution & Impact
The **KENYA_AGRICULTURAL_YIELD_AND_MAIZE_PRICE_FORECASTING_ENGINE** bridges this gap by transforming chaotic, raw multi-source data into a centralized, automated intelligence platform. By combining robust relational data storage, advanced time-series feature engineering, machine learning regression models, and an interactive Streamlit dashboard, this project delivers actionable foresight to stabilize markets, guide agricultural planning, and empower data-driven policy making.
