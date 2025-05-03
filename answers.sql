-- Question 1: Achieving First Normal Form (1NF)
-- The original table had a 'Products' column with multiple comma-separated values,
-- which violates the rule of atomicity in 1NF.
-- In 1NF, each field should hold only a single value.

-- Step 1: Create a new table that follows 1NF rules
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Step 2: Insert the transformed data (one product per row)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- Question 2: Achieving Second Normal Form (2NF)
-- The original table had a partial dependency: CustomerName depended only on OrderID.
-- To achieve 2NF, we split this into two tables:
--   1. One for Customer info (OrderID → CustomerName)
--   2. One for Product info (OrderID + Product → Quantity)

-- Step 1: Create the Customers table
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Create the OrderItems table
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),  -- Composite Primary Key
    FOREIGN KEY (OrderID) REFERENCES Customers(OrderID)
);

-- Step 3: Insert customer data into the Customers table
INSERT INTO Customers (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 4: Insert product data into the OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);


