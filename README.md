# Sephora Product Analysis

An end-to-end analytics engineering and statistical modeling project that transforms raw e-commerce data into data marts using **dbt Core** and **DuckDB**, powering downstream analysis in both **R** and **Python**.

---

## Project Motivation & Evolution

This repository started as an R-based analysis for a graduate school class. Around the same time, I started diving deeper into dbt and data engineering practices at work, and I wanted a hands-on project to bring those two worlds together. I used this dataset to bridge the gap between one-off analytics scripts and structured, production-style data pipelines.

Looking ahead, I'm using this setup as the foundation for my upcoming graduate coursework in Machine Learning and Natural Language Processing (NLP). Here is a quick look at what I've built so far:
* Building a trustworthy data foundation: Turned a messy, raw CSV into modular, tested, and documented dbt models so the numbers are actually reliable.
* Keeping local processing fast: Swapped out heavy in-memory data frames for DuckDB, letting me run SQL queries locally without draining system memory.
* Connecting R and Python: Built clean analytical marts (fact_product_metrics, dim_brands) that act as a single source of truth for both my original R statistical work and my new Python modeling notebooks.

---

## Architecture & Tech Stack

| Layer | Technology | Key Function |
| :--- | :--- | :--- |
| **Data Warehouse** | DuckDB | database for local analytical work instead of notebook chunks |
| **Data Engineering** | dbt | Staging layers, macros, modular models, and data tests |
| **Legacy Analytics** | R | Baseline statistical analysis reading directly from DuckDB marts |

---

## Repository Structure

```text
.
├── dbt/                          
│   ├── macros/                   
│   ├── models/                   
│   └── dbt_project.yml
├── notebooks/
│   ├── dbt/                      
│   │   └── duckdb_access.ipynb   
│   └── r_legacy/                 
│       └── r_code.rmd            
├── .gitignore                    
└── README.md

```
---

## Future Improvements

* **Automated Data Ingestion:** Build an API pipeline to pull fresh Sephora (or other e-commerce business) product and review data automatically
* **Orchestration:** Use Airflow DAGs to schedule and automate
* **ML and NLP Expansion:** Apply non-linear models (like Random Forest and XGBoost) and text analysis on product reviews as part of my continuing graduate coursework.

---
