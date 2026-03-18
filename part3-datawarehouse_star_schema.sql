
## dim_date
CREATE TABLE dim_date (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    full_date DATE,
    day INT,
    month INT,
    year INT
);

## dim_store

CREATE TABLE dim_store (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

## dim_product

CREATE TABLE dim_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

## Fact_table

CREATE TABLE fact_sales (
	sales_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id VARCHAR(50),  -- from source system
    date_id INT,
    store_id INT,
    product_id INT,
    customer_id INT,
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

INSERT INTO dim_date (full_date, day, month, year) VALUES
('02-01-2023', 2, 1, 2023),
('04-01-2023', 4, 1, 2023),
('05-01-2023', 5, 1, 2023),
('06-01-2023', 6, 1, 2023),
('07-01-2023', 7, 1, 2023); 

INSERT INTO dim_store (store_name, store_city) VALUES
('Bangalore MG', 'Bangalore'),
('Chennai Anna', 'Chennai'),
('Delhi South', 'Delhi'),
('Mumbai Central', 'Mumbai'),
('Pune FC Road', 'Pune');

INSERT INTO dim_product (product_name, category)VALUES
('Atta 10kg', 'Groceries'),
('Biscuits', 'Groceries'),
('Headphones', 'Electronics'),
('Jacket', 'Clothing'),
('Jeans', 'Clothing');

INSERT INTO fact_sales VALUES
('TXN5031', 1, 1, 14, 'CUST010', 20, 49262.78, 985255.6),
('TXN5198', 1, 5, 14, 'CUST030', 38, 49262.78, 394102.2),
('TXN5182', 2, 2, 1, 'CUST029', 8, 52195.05, 417560.4),
('TXN5226', 2, 2, 7, 'CUST001', 1, 43374.39, 43374.39),
('TXN5281', 3, 5, 9, 'CUST025', 12, 48703.39, 52000),
('TXN5263', 4, 1, 10, 'CUST033', 4, 31604.47, 126417.9),
('TXN5246', 5, 5, 11, 'CUST050', 13, 52195.05, 678535.7),
('TXN5179', 6, 2, 4, 'CUST019', 6, 30187.24, 181123.4),
('TXN5218', 7, 4, 5, 'CUST038', 5, 2317.47, 11587.35),
('TXN5061', 8, 2, 9, 'CUST021', 14, 48703.39, 681847.5);