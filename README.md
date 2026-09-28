# 👟 Nike Shoes Sales SQL Analysis

A PostgreSQL data analysis project focused on analyzing Nike shoes product data using **PostgreSQL, SQL, and pgAdmin 4**.

The project provides an analytical view of product pricing, sale prices, discounts, ratings, customer reviews, product categories, and brand-level performance.

---

## 📌 Project Overview

The objective of this project is to analyze Nike shoes product data and transform raw product information into meaningful business insights through **data exploration, data cleaning, SQL analysis, aggregation, conditional logic, and business-oriented queries**.

The project focuses on:

- Product price analysis
- Sale price analysis
- Discount analysis
- Product-level analysis
- Customer rating analysis
- Customer review analysis
- Price category analysis
- Brand analysis
- Data quality and cleaning
- Business question analysis

---

## 📁 Dataset

The project uses the following CSV dataset:

```text
nike_shoes_sales.csv
```
The main dataset contains information such as:

- Product Name
- Product ID
- Listing Price
- Sale Price
- Discount
- Brand
- Description
- Rating
- Reviews

The dataset is used for educational and portfolio purposes.

## 🛠️ Technologies Used

- PostgreSQL
- SQL
- pgAdmin 4
- Data Analysis
- Data Cleaning
- Exploratory Data Analysis
- Git & GitHub

## 🔄 Project Workflow
```text
CSV Dataset
      ↓
PostgreSQL Database
      ↓
Table Creation
      ↓
Data Import
      ↓
Data Exploration
      ↓
Data Cleaning
      ↓
SQL Analysis
      ↓
Business Questions
      ↓
Business Insights
```

##🗄️ Database Structure

The project uses a PostgreSQL table named:
```text
nike
```
The table contains:
```text
| Column          | Description                            |
| --------------- | -------------------------------------- |
| `sku_id`        | Unique identifier for each SKU         |
| `product_name`  | Name of the Nike shoe                  |
| `product_id`    | Product identifier                     |
| `listing_price` | Original listed price                  |
| `sale_price`    | Product selling price                  |
| `discount`      | Discount value provided in the dataset |
| `brand`         | Product brand                          |
| `description`   | Product description                    |
| `rating`        | Customer rating                        |
| `reviews`       | Number of customer reviews             |
```

##🔍 Data Exploration

The project performs data exploration to understand the structure and quality of the dataset.

- Exploration includes:
- Total number of records
- Sample records
- NULL value analysis
- Distinct product analysis
- Product frequency analysis
- Duplicate product ID checking
- Sale price analysis
- Rating analysis
- Review analysis

## 🧹 Data Cleaning

The project performs several data-cleaning operations before analysis.

**Missing Values**

Missing product descriptions are replaced with:
```text
No description available
```
**Invalid Prices**

Products with a listing price of 0 are identified and removed before performing price and discount analysis.

**Discount Calculation**

The discount percentage is calculated using:
```text
((Listing Price - Sale Price) / Listing Price) × 100
```
This calculated value is used for discount-related analysis.

## 📊 SQL Analysis

The project uses SQL to analyze Nike product data across multiple areas.

**Price Analysis**

The analysis includes:

- Minimum sale price
- Maximum sale price
- Average sale price
- Listing price
- Sale price
- Discount amount
- Discount percentage

**Product Analysis**

The analysis includes:

- Unique products
- Products with multiple SKUs
- Highest-priced products
- Highest-discount products
- Product-level performance

**Rating & Review Analysis**

The project analyzes:

- Highest-rated products
- Lowest-rated products
- Products with the highest number of reviews
- High-priced products with low ratings
- Average product rating

**Price Category Analysis**

Products are grouped into:

- Low Price
- Medium Price
- Premium

using SQL CASE statements.

**Brand Analysis**

The project compares brands based on:

- Number of products
- Average sale price
- Average rating
- Total reviews

## 🔍 Business Questions

This project is designed to answer questions such as:

1. Which products have the highest discount percentage?
2. Which high-priced products have low customer ratings?
3. What is the estimated product value using reviews as a proxy?
4. Which products have a listing price above 15,000 and a discount below 30%?
5. Which products have the highest average discount percentage?
6. How are products distributed across different price categories?
7. Which products have the highest customer ratings?
8. Which products have the highest number of reviews?
9. Which brands have the highest number of products?
10. Which brands have the highest average sale price?
11. Which brands have the highest average rating?
12. How does customer review volume vary across products?

## 📊 Business Analysis

The SQL queries are designed to provide practical insights from a business perspective.

Examples include:

- Identifying highly discounted products
- Finding expensive products with lower customer ratings
- Understanding the distribution of products by price range
- Comparing brands based on product count and average price
- Identifying highly reviewed products
- Understanding product rating patterns

## 📂 Project Structure
```text
Nike-Shoes-Sales-SQL-Analysis/
│
├── nike_shoes_sales.csv
│
├── nike_shoes_sales_analysis.sql
│
├── README.md
├── LICENSE
└── .gitignore
```
## 👨‍💻 Author

**Gowtham S**

**Aspiring Data Analyst**

### Skills Demonstrated

- SQL
- PostgreSQL
- Power BI
- Data Analysis
- Data Cleaning
- Exploratory Data Analysis
- Business Analysis
- Microsoft Excel
- Power BI


## 🎯 Portfolio Purpose

This project demonstrates practical skills in SQL, PostgreSQL, data cleaning, exploratory data analysis, business analysis, and analytical problem-solving.

The project shows how raw product data can be transformed into meaningful business insights using SQL.

This project is part of my Data Analyst portfolio and demonstrates practical SQL skills through a real-world product analysis use case.
