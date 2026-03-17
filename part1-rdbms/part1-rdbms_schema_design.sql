-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL UNIQUE,
    customer_city VARCHAR(50) NOT NULL
);

-- 2. Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- 3. Sales Representatives Table
CREATE TABLE Sales_Reps (
    sales_rep_id INT PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL UNIQUE,
    office_address VARCHAR(200) NOT NULL
);

-- 4. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    sales_rep_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (sales_rep_id) REFERENCES Sales_Reps(sales_rep_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- 5. Order_Items Table
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO Customers (customer_id, customer_name, customer_email, customer_city) VALUES
('C001','Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002','Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003','Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004','Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005','Vikram Singh', 'vikram@gmail.com', 'Mumbai');

INSERT INTO Products (product_id, product_name, category, unit_price) VALUES
('P001','Laptop', 'Electronics', 55000),
('P002','Mouse', 'Electronics', 800),
('P003','Desk Chair', 'Furniture', 8500),
('P004','Notebook', 'Stationery', 120),
('P005','Headphones', 'Electronics', 3200);

INSERT INTO Sales_Reps (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES
('SR01','Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02','Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03','Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001');

INSERT INTO Orders (order_id, customer_id, sales_rep_id, order_date) VALUES
('ORD1000', 'C002', 'SR03','21-05-2023'),
('ORD1001', 'C004', 'SR03','22-02-2023'),
('ORD1002', 'C002', 'SR02','17-01-2023'),
('ORD1003', 'C002', 'SR01','16-09-2023'),
('ORD1004', 'C001', 'SR01','29-11-2023');

INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
('ORD1000', 'P001', 2),
('ORD1001', 'P002', 5),
('ORD1002', 'P005', 1),
('ORD1003', 'P002', 5),
('ORD1004', 'P005', 5);

