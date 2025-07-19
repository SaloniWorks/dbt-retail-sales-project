# dbt Retail Sales Data Pipeline Project

This project demonstrates an end-to-end data pipeline designed for retail sales analytics using Google Cloud Platform (GCP), Apache Airflow, and dbt Core + dbt Cloud.

## Project Overview

- **Data Source:** Synthetic retail sales data generated via Mockaroo  
- **Storage:** Raw CSVs uploaded to **Google Cloud Storage (GCS)**  
- **Ingestion:** Airflow DAG ingests raw data into **BigQuery staging tables**  
- **Transformation:** dbt Core models include:
  - Staging models  
  - SCD Type 2 snapshot  
  - Dimension tables  
  - Fact table  
- **Schema:** Designed using a **star schema** for optimized analytics and reporting  
- **Orchestration:** Version-controlled via GitHub, scheduled via **dbt Cloud**  
- **Validation:** Data quality checks using:
  - dbt built-in tests  
  - `dbt_utils` macros  
  - Custom SQL tests  

## Tech Stack

- Google Cloud Platform (BigQuery, Cloud Storage)  
- Apache Airflow  
- dbt Core & dbt Cloud  
- SQL, Python  
- Git, GitHub  

## Folder Structure

```text
dbt-retail-sales-project/
├── dags/                 # Airflow DAGs for data ingestion (GCS → BigQuery)
├── dbt_project.yml
├── models/
│   ├── staging/          # Cleansed versions of raw tables
│   ├── snapshots/        # SCD Type 2 historical tracking
│   └── marts/
│       ├── dim/          # Dimension tables
│       └── fact/         # Fact tables
└── README.md
```


> **Note:** While `dags/` is not part of the dbt framework, it’s included here to reflect the complete pipeline. The Airflow DAG handles ingestion of raw data from GCS into BigQuery. The dbt models then transform this ingested data into analytics-ready tables.

## Key Features

-  End-to-end ELT pipeline for retail analytics  
-  Implements incremental loading and SCD Type 2 history tracking  
-  Clean, modular dbt project structure  
-  Reproducible pipeline with automated scheduling and testing  


