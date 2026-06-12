# Proyecto-final-Data-analytics
Proyecto final de bootcamp de data analytics con Ironhack.
# Seller Performance Analysis in the Olist E-Commerce Marketplace

## Introduction

This project focuses on analyzing seller performance within the Brazilian e-commerce marketplace **Olist**.

The main objective of the analysis is to understand how seller behavior impacts marketplace performance from both an economic and operational perspective.

The project combines:

* sales analysis
* customer satisfaction metrics
* seller segmentation

The final goal is to identify:

* high-performing sellers
* operational risk sellers
* strategic business insights for marketplace management.

---

# Description of the Data and Data Sources

The project uses the **Brazilian E-Commerce Public Dataset by Olist**, publicly available on Kaggle.

The dataset contains approximately:

* 100,000 orders
* 110,000 order items
* 3,000 sellers
* data between 2016 and 2018

Main tables used:

* customers
* orders
* order_items
* sellers
* products
* reviews
* payments

The dataset represents a real multi-vendor marketplace environment and includes both transactional and logistics-related information.

Source:

* Kaggle — Olist Brazilian E-Commerce Dataset

---

# Explanation of Our Methodology

The project followed a complete end-to-end data analytics workflow.

## 1. Data Cleaning and Preprocessing

Using Python:

* missing value handling
* date conversion
* feature engineering
* logistics variable creation

Main libraries:

* pandas
* numpy
* sqlalchemy
* pymysql

---

## 2. Relational Database Modeling and SQL Analytics

Using MySQL Workbench:

relational database creation
table import and validation
primary keys and foreign keys creation
relational model validation through an EER diagram

Several analytical SQL views were developed:

seller_performance_base
seller_segments
seller_monthly_performance
seller_category_performance
category_performance

Additional business KPIs and logistics metrics were created:

delivery_days
delay_days
delay_rate_pct
avg_order_value
monthly_revenue

The SQL phase focused on transforming raw transactional data into business-oriented analytical views ready for dashboard visualization and seller performance analysis.

---

## 4. Dashboard Development

Using Tableau:

* seller segmentation dashboards
* revenue evolution analysis
* temporal seller activity
* operational risk visualization

---

# Research Questions and Conclusions

## Main Research Questions

* Which sellers generate the highest marketplace value?
* Are high-revenue sellers always operationally efficient?
* How do reviews and delivery performance affect seller quality?
* What seller patterns can be identified over time?

---

## Conclusions

* Revenue does not necessarily imply operational quality.
* Some high-value sellers also represent operational risk.
* Customer satisfaction and logistics should be analyzed together with revenue.
* Standard Sellers represent the largest aggregated marketplace volume.
* Marketplace management should monitor both economic impact and operational performance.

---

# Main Findings and Insights

Main insights identified during the analysis:

* The marketplace follows a long-tail structure.
* A small number of sellers generates a disproportionately high share of total revenue.
* Several sellers with excellent reviews maintain consistent long-term performance.
* Delivery delays strongly impact customer satisfaction.
* Operational risk sellers can negatively affect marketplace reputation despite generating revenue.

The dashboards helped identify:

* high-performing sellers
* operationally risky sellers
* seller activity evolution over time
* geographic concentration of marketplace activity

---

# Further Questions and Next Steps

Possible future improvements include:

* product category-level analysis
* predictive models for seller risk
* automated seller scoring systems
* customer retention analysis
* seller churn prediction
* anomaly detection for operational incidents

Future versions of the project could also integrate:

* machine learning models
* real-time monitoring dashboards
* automated business alerts

---

# Author

Arnau Matas
Ironhack — Data Analytics Bootcamp
