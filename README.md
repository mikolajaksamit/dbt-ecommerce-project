# E-commerce Analytics & Data Platform (Olist)

End-to-end data engineering and business intelligence project built on the public Brazilian E-Commerce dataset (Olist). The project covers the full lifecycle of data: from raw relational tables in a local data warehouse to transformation pipelines, automated testing, CI/CD, and final visualization dashboards.

---

## Architecture & Tech Stack

* **Database / Data Warehouse:** PostgreSQL (hosted locally via Docker)
* **Transformation & Modeling:** dbt (data build tool) following a structured multi-layer architecture (Staging -> Marts)
* **Orchestration & Automation:** Apache Airflow & Continuous Integration Pipeline (GitHub Actions)
* **Business Intelligence & Dashboards:** Metabase

![DAG](Assets/DAG.png)

---

## Project Structure

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

## Analytics & Dashboards (Metabase)

The project is integrated with Metabase to deliver key business insights through a cohesive dashboard:

* **Executive KPIs:** Total Revenue, Total Unique Customers, Total Orders, and Average Order Value.
* **Revenue Trends:** Macro-level growth analysis over time.
* **Product & Regional Breakdown:** Revenue performance by product categories and geographical states (`seller_state`).
* **Customer Cohort & Retention Analysis:** Tracking customer acquisition dynamics and long-term activity offsets (`cohort_month` & `month_offset`).

![Metabase Dashboard](Assets/metabase_dashboard.png)

### Executive Summary & Key Business Insights

Based on analytical queries and dashboard metrics, several critical commercial patterns were identified across the Olist marketplace:

* **São Paulo (SP) Revenue Dominance:** Sellers from the **SP** state generated **$8.75M**, accounting for **64%** of the platform's total gross revenue (**$13.6M**). The second-largest state (PR at **$1.26M**) generated nearly 7x less revenue, highlighting heavy regional supplier concentration.
* **Top 3 Category Concentration:** The three leading categories (`health_beauty`, `watches_gifts`, and `bed_bath_table`) brought in **over $3.5M**, representing **more than 25%** of total platform turnover. `health_beauty` is the absolute leader at **$1.26M**, demonstrating strong consumer demand for high-margin, easily shippable products.
* **Black Friday Peak & 2018 Stabilization:** In November 2017, monthly revenue breached the **$1.0M** mark for the first time, with active customers peaking at **~15,000**. Throughout 2018, the platform entered a mature operational phase, consistently generating **$850k–$1.0M monthly** with **12,000–14,000 active customers** per month.
* **Seller Efficiency & Order Economics:** The platform processed **99,441 orders** across **3,095 unique sellers**, maintaining an Average Order Value (**AOV**) of **$137.80**. With an average of **~$4,394 revenue per seller**, Pareto distribution indicates significant potential for targeted seller retention and loyalty programs.

---

## CI/CD Pipeline (GitHub Actions)

To ensure code quality and data integrity, the repository features an automated CI/CD pipeline built with GitHub Actions.

Whenever code is pushed or a Pull Request is opened against the `main` branch, GitHub Actions automatically:

* Sets up a Python and dbt environment.
* Configures a secure, isolated CI execution profile.
* Runs automated dbt validation (`dbt parse` / `dbt test`) to verify SQL syntax, schema definitions, and model graph integrity before any changes are merged.