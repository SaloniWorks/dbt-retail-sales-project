# dbt Retail Sales Data Pipeline Project

This project demonstrates an end-to-end data pipeline designed for retail sales analytics using **Google Cloud Platform (GCP), Snowflake, Apache Airflow, and dbt Core + dbt Cloud**.

## Project Overview
This project demonstrates an end-to-end ELT pipeline for retail sales analytics using two cloud platforms: Google Cloud Platform (BigQuery) and Snowflake.
- **Data Source:** Synthetic retail sales data generated via Mockaroo  
- **Storage:**
  - **BigQuery:** Raw CSVs are stored in Google Cloud Storage (GCS)
  - **Snowflake:** Raw CSVs are stored locally and staged to Snowflake internal stages
- **Ingestion:**
  - **BigQuery:** Raw CSVs are uploaded to Google Cloud Storage (GCS) and ingested using Apache Airflow DAGs.
  - **Snowflake:** CSVs are staged using SnowSQL and loaded into Snowflake tables via COPY INTO commands. 
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
---
## Tech Stack

- Google Cloud Platform (BigQuery, Cloud Storage, Snowflake)  
- Apache Airflow  
- dbt Core & dbt Cloud  
- SQL, Python  
- Git, GitHub  
---
## Folder Structure

```text
dbt-retail-sales-project/
├── dags/                 # Airflow DAGs for data ingestion (GCS → BigQuery) / SnowSQL for data ingestion in snowflake
├── dbt_project.yml
├── models/
│   ├── staging/          # Cleansed versions of raw tables
│   ├── snapshots/        # SCD Type 2 historical tracking
│   └── marts/
│       ├── dim/          # Dimension tables
│       └── fact/         # Fact tables
└── README.md
```


> **Note:** While dags/ is not part of the dbt framework, it’s included here to reflect the complete pipeline. The Airflow DAG handles GCS ingestion, and SnowSQL handles Snowflake ingestion.
---
## Key Features

-  End-to-end ELT pipeline for retail analytics  
-  Implements incremental loading and SCD Type 2 history tracking  
-  Clean, modular dbt project structure  
-  Reproducible pipeline with automated scheduling and testing  
---
 ## Multi-Cloud Target Support

This project is designed to support both BigQuery and Snowflake as data warehouse targets with minimal changes, demonstrating flexibility and adaptability in modern data engineering workflows.
  1. BigQuery Integration

    Ingestion: Automated using Apache Airflow to load raw CSVs from Google Cloud Storage (GCS) into BigQuery staging tables.

    Transformation: dbt Core models (staging, snapshots, marts) run against BigQuery using the configured profiles.yml and sources.yml file.

    Date Dimension: Custom logic written using BigQuery-compatible SQL functions for calendar generation.

    Scheduling: Orchestrated using dbt Cloud, with GitHub as the version control system.

 2.  Snowflake Integration

    Ingestion: Handled using SnowSQL, where raw CSVs are uploaded to internal stages and loaded using COPY INTO commands.

    Transformation: The same dbt Core models and snapshots used for BigQuery run seamlessly on Snowflake with dedicated profiles.yml and sources.yml configurations.

    Date Dimension: Custom logic rewritten using Snowflake-compatible SQL functions for calendar generation.

    Orchestration: Scheduled via dbt Cloud with a separate environment targeting Snowflake.

3.  Switching Between Targets

The project uses a single codebase with the ability to switch targets **(BigQuery or Snowflake)** by:

    Modifying the target key in the profiles.yml

    Adjusting the sources.yml as needed

    Ensuring SQL logic is compatible with the selected platform

All sensitive configuration (e.g., credentials, profiles.yml) remains outside the repository to ensure security and separation of concerns.
