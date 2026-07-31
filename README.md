 # E-commerce Analytics & Data Platform (Olist)

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![Apache Airflow](https://img.shields.io/badge/Airflow-017CEE?style=for-the-badge&logo=apacheairflow&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)
![Metabase](https://img.shields.io/badge/Metabase-509EE3?style=for-the-badge)

End-to-end data engineering and business intelligence project built on the public Brazilian E-Commerce dataset (Olist). The project covers the full lifecycle of data: from raw relational tables in a local data warehouse to transformation pipelines, automated testing, CI/CD, and final visualization dashboards.

---

# Architecture & Tech Stack

* **Database / Data Warehouse:** PostgreSQL (hosted locally via Docker)
* **Transformation & Modeling:** dbt (data build tool) following a structured multi-layer architecture (Staging → Marts)
* **Orchestration & Automation:** Apache Airflow & Continuous Integration Pipeline (GitHub Actions)
* **Business Intelligence & Dashboards:** Metabase

![DAG](Assets/DAG.png)

---

# Pipeline Overview

```text
Raw Olist Dataset
        │
        ▼
 PostgreSQL (Docker)
        │
        ▼
     dbt Models
        │
        ▼
     dbt Tests
        │
        ▼
 Apache Airflow
        │
        ▼
   Metabase Dashboard
```

---

# Project Features

- End-to-end ELT pipeline
- Layered dbt architecture (Staging → Marts)
- Automated data quality validation
- CI/CD pipeline using GitHub Actions
- Workflow orchestration with Apache Airflow
- Interactive business dashboard in Metabase
- Customer Cohort Analysis
- Revenue & Seller Analytics
- Product Category Performance
- Business KPI Reporting

---

# Project Structure

```text
├── .github/workflows/       # Automated CI pipeline definitions
├── dags/                    # Apache Airflow DAGs for pipeline orchestration
├── analyses/                # Ad-hoc SQL queries and analytical scripts
├── models/                  # dbt models (Staging & Mart layers)
│   ├── staging/             # Cleaned and renamed raw sources
│   └── marts/               # Business-ready aggregates (Cohort analysis, Revenue, etc.)
├── tests/                   # Custom data tests and assertions
├── dbt_project.yml          # Main dbt project configuration
└── README.md                # Project documentation
```

![dbt docs](Assets/DBT%20docs.png)

---

# Business Intelligence Dashboard

The project is integrated with Metabase to deliver key business insights through a cohesive dashboard:

* **Executive KPIs:** Total Revenue, Total Unique Customers, Total Orders, and Average Order Value.
* **Revenue Trends:** Macro-level growth analysis over time.
* **Product & Regional Breakdown:** Revenue performance by product categories and geographical states (`seller_state`).
* **Customer Cohort & Retention Analysis:** Tracking customer acquisition dynamics and long-term activity offsets (`cohort_month` & `month_offset`).

![Metabase Dashboard](Assets/metabase_dashboard.png)

---

## Executive Summary & Key Business Insights

Based on analytical queries and dashboard metrics, several commercial patterns were identified across the Olist marketplace:

* **São Paulo (SP) Revenue Dominance:** Sellers from the **SP** state generated **$8.75M**, accounting for **64%** of total marketplace revenue (**$13.6M**). The second-largest state (**PR**) generated only **$1.26M**, highlighting strong regional supplier concentration.

* **Top Product Categories:** The categories **health_beauty**, **watches_gifts**, and **bed_bath_table** generated over **$3.5M**, representing more than **25%** of total revenue. **health_beauty** alone exceeded **$1.26M**.

* **Black Friday Peak:** Monthly revenue surpassed **$1M** for the first time during **November 2017**, while active customers peaked at approximately **15,000**.

* **Business Stabilization:** Throughout 2018 the platform consistently generated **$850k–$1.0M** in monthly revenue with **12k–14k active customers**.

* **Seller Performance:** The marketplace processed **99,441 orders** across **3,095 sellers**, producing an **Average Order Value (AOV)** of **$137.80** and approximately **$4,394 revenue per seller**.

---

# CI/CD Pipeline (GitHub Actions)

To ensure code quality and data integrity, the repository features an automated CI pipeline built with GitHub Actions.

Whenever code is pushed or a Pull Request is opened against the `main` branch, GitHub Actions automatically:

* Sets up a Python and dbt environment.
* Configures a secure CI execution profile.
* Runs automated validation (`dbt parse` + `dbt test`).
* Verifies SQL syntax, schema definitions and model graph integrity before merge.

