## Architecture Recommendation

A Data Lakehouse architecture is the most suitable choice for this fast-growing food delivery startup because it effectively handles diverse data types while supporting both analytics and machine learning workloads.

First, the startup generates multiple types of data: structured data such as payment transactions and GPS logs, and unstructured data such as customer reviews (text) and restaurant menu images. A traditional Data Warehouse is not well-suited for unstructured data, while a Data Lake can store all data types but lacks efficient querying and structure. A Data Lakehouse combines the strengths of both by allowing storage of raw data in its native format while also enabling structured querying using SQL.

Second, the business requires both operational analytics and AI-driven insights. For example, management may need reports on delivery times, revenue, and customer behavior, while data science teams may build models for delivery time prediction, recommendation systems, or sentiment analysis on reviews. A Data Lakehouse supports both use cases within a single platform, eliminating the need for separate systems and reducing data movement.

Third, it is highly cost-effective and scalable. Since the startup deals with high-volume data like GPS logs and images, storing everything in a Data Warehouse would be expensive. A Data Lakehouse uses low-cost storage while still providing high performance through optimized query engines.

Finally, it offers better governance than a Data Lake, with features like schema enforcement, ACID transactions, and data versioning, ensuring data reliability.

Overall, a Data Lakehouse provides the flexibility, scalability, and performance required for a modern, data-driven startup.
