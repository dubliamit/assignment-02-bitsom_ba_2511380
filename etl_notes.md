ETL Decisions

Decision 1 — Duplication due to spelling change

Problem:
Raw data for category is having same word written differently - "Grocery" and "Groceries".

Resolution:
While inputting the value same is taken care and put only one "Groceries".

Decision 2 — Handling NULL and Missing Values

Problem:
Some records had NULL values in important fields like store_city. This could lead to incorrect revenue calculations or incomplete dimension mapping.

Resolution:

While creating a table I have added NOT NULL for city which automatically stops inputting null values in the table.

