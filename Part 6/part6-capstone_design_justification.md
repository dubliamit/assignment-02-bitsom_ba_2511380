6.2 Design Justification	

## Storage Systems

To meet the four goals, a combination of storage systems is used, each optimized for a specific type of workload-

1. Predict patient readmission risk
	A data Warehouse (OLAP system) is used to store historical patient data such has treatments, diagnoses, and past admissions. 	Structured data from EHR (Electronic health record) and billing systems is cleaned and transformed before loading. This ensures 	consistency and high-quality input for machine learning models.
2. Natural language query by doctors
	A combination of a relational database and a search / indexing system is used. The relational database stores structured patients 	records, while the search layer enables fast retrieval and supports NLP.
3. Monthly management records
	Data warehouse is used here because it is designed for reporting and analytics. Data such as bed occupancy, department cost, and 	performance metrics are aggregated periodically. Star or snowflake schema helps in fast report generation and dashboard making.
4. Real time ICU vitals streaming
	A Real-Time Database is used. These systems are optimized for high-frequency data ingestion and time-based queries. ICU devices 	continuously push data, which is stored with timestamps and can trigger alerts or be visualized in dashboards.

## OLTP vs OLAP Boundary

The OLTP (Online transaction processing) system includes all real time, operational data handling. This covers Patient record updates, billing transactions and ICU real time vitals ingestion. These systems are optimized for fast inserts, updates, and low latency queries.

The OLAP (Online analytical processing) system begins at Data warehouse layer. Data is extracted from OLTP systems through ETL/ELT pipelines, cleaned and transformed before being loaded into the warehouse. So the boundary lies at the data pipeline stage.
Before pipeline - OLTP (Live transactional systems)
After pipeline - OLAP (historical analytical systems)
This separation ensures that heavy analytical queries do not affect real time hospital operations.


## Trade Offs

A key trade-off in this design is between real-time performance and data consistency.

For example, real-time ICU data is streamed and processed quickly using a time-series or NoSQL system. However, this may lead to eventual consistency, where the latest data may not immediately reflect in the data warehouse or reports.

Handling this by

1. Using both architectures.
2. Critical alerts alarms.
3. Implement data validation and reconciliation jobs to ensure consistency between real-time and analytical layers.

This approach balances speed and accuracy, ensuring patient safety while still enabling deep analytical insights.
