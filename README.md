Project Overview
This project is a personal portfolio implementation of an end to end Azure Data Engineering solution. I built this project to understand how data flows in real world systems, starting from raw data ingestion to analytics ready datasets that can be consumed by reporting tools.
The project follows a practical and interview oriented approach and uses commonly adopted Azure services such as Azure Data Factory, Azure Databricks, Azure Synapse Analytics, Azure Data Lake Storage Gen2, and Power BI. The focus of the project is not only on moving data, but also on building scalable pipelines, applying transformations, securing access, and preparing clean serving layer data.
The dataset used is the Adventure Works dataset, sourced from GitHub, which contains multiple related tables such as sales, customers, products, calendar, returns, and territories.

Architecture and Design
The solution follows the Medallion Architecture pattern.
Bronze layer stores raw data exactly as it is ingested from the source
Silver layer stores cleaned and transformed data in parquet format
Gold layer serves analytics ready data using views and external tables
Azure Data Lake Storage Gen2 is used as the central storage layer with a hierarchical namespace enabled. Azure Synapse Serverless SQL Pool is used to query data directly from the data lake and to create external tables using CETAS.

Phase 1 Data Ingestion
In the first phase, data is ingested from the GitHub API into the Bronze layer of Azure Data Lake Storage.
Azure Data Factory is used to orchestrate ingestion. Instead of creating multiple static pipelines, I implemented dynamic pipelines using parameters, ForEach activities, and dynamic content. Metadata for the files is stored in a JSON configuration file which allows the pipeline to scale easily when new datasets are added.
This phase focuses on building reusable and maintainable pipelines rather than one time copy activities.

Phase 2 Data Transformation
In the second phase, data from the Bronze layer is transformed and written into the Silver layer.
Azure Databricks is used for data processing and analysis. Spark notebooks handle data cleansing, column transformations, and enrichment. Common transformations include date derivations, string operations, column creation, and data type standardization.
The transformed data is stored in parquet format to improve query performance and storage efficiency. Basic aggregations and exploratory analysis are also performed using Spark SQL and Databricks visualizations.

Phase 3 Serving Layer and Analytics
In the final phase, Azure Synapse Analytics is used to build the serving layer.
Serverless SQL Pool is used to create views on top of the silver layer using OPENROWSET. These views act as logical abstractions over the data stored in the data lake.
External tables are created using CREATE EXTERNAL TABLE AS SELECT. This materializes data into the Gold layer as parquet files. Database scoped credentials, external data sources, and external file formats are configured using managed identity for secure access.
The Gold layer is designed to support analytics and reporting workloads.

Power BI Integration
Power BI is connected to the Synapse Serverless SQL endpoint. External tables from the Gold layer are loaded into Power BI to build basic reports and visualizations.
This demonstrates how data engineered in the platform can be directly consumed by business users and analysts.

Security and Access Management
Security is handled using Azure managed identities. No storage keys or secrets are hardcoded in the solution.
The Synapse workspace managed identity is granted the Storage Blob Data Contributor role on the data lake. Databricks access is configured using service principal authentication. This approach follows cloud security best practices.

Tools and Technologies Used
Azure Data Factory
Azure Databricks
Azure Synapse Analytics
Azure Data Lake Storage Gen2
Power BI
Apache Spark
Parquet format
SQL Serverless

What This Project Demonstrates
This project demonstrates my understanding of end to end data engineering workflows on Azure. It shows how to design scalable ingestion pipelines, apply transformations using Spark, implement lakehouse style querying with Synapse Serverless, and expose curated data for analytics.
The project is built with real world scenarios in mind and reflects patterns commonly used in production data platforms.

Future Improvements
Incremental data loading
Data quality checks and validation
Pipeline monitoring and alerting
CI CD integration for deployment
Advanced Power BI dashboards


