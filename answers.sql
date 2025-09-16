USE salesdb;

-- Question 1 Achieving 1NF (First Normal Form)
-- Create a new table to hold normalized product data
CREATE TABLE ProductDetail_1NF (  -- New table for 1NF structure
    OrderID INT,                 -- Each order keeps its unique ID
    CustomerName VARCHAR(100),  -- Customer name stays the same
    Product VARCHAR(100)        -- Only one product per row
);

-- Insert individual products for Order 101
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');  -- First product from Order 101
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');   -- Second product from Order 101

-- Insert individual products for Order 102
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');    -- First product from Order 102
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');  -- Second product from Order 102
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');     -- Third product from Order 102

-- Insert individual product for Order 103
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');    -- Only product from Order 103


-- Question 2 Achieving 2NF (Second Normal Form) 
-- Create a table for customer details
CREATE TABLE Customers (                      -- Stores customer info separately
    OrderID INT PRIMARY KEY,                  -- Each order has one customer
    CustomerName VARCHAR(100)                 -- Customer name depends only on OrderID
);

-- Insert customer data based on OrderID
INSERT INTO Customers VALUES (101, 'John Doe');       -- Order 101 belongs to John Doe
INSERT INTO Customers VALUES (102, 'Jane Smith');     -- Order 102 belongs to Jane Smith
INSERT INTO Customers VALUES (103, 'Emily Clark');    -- Order 103 belongs to Emily Clark


-- Create a normalized order details table
CREATE TABLE OrderDetails_2NF (               -- Stores product and quantity per order
    OrderID INT,                              -- Links to Customers table
    Product VARCHAR(100),                     -- Each product listed separately
    Quantity INT                              -- Quantity of each product
);


-- Insert product details for each order
INSERT INTO OrderDetails_2NF VALUES (101, 'Laptop', 2);     -- John ordered 2 laptops
INSERT INTO OrderDetails_2NF VALUES (101, 'Phone', 1);      -- John ordered 1 phone
INSERT INTO OrderDetails_2NF VALUES (102, 'Tablet', 3);     -- Jane ordered 3 tablets
INSERT INTO OrderDetails_2NF VALUES (102, 'Keyboard', 1);   -- Jane ordered 1 keyboard
INSERT INTO OrderDetails_2NF VALUES (103, 'Phone', 2);      -- Emily ordered 2 phones