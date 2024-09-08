-- World
-- 1.
SELECT Name FROM country WHERE Continent = 'South America';

-- 2.
SELECT Population FROM country WHERE Name = 'Germany';

-- 3.
SELECT Name FROM city WHERE CountryCode = (SELECT Code FROM country WHERE Name = 'Japan');

-- 4.
SELECT Name, Population FROM country WHERE Continent = 'Africa' ORDER BY Population DESC LIMIT 3;

-- 5.
SELECT Name, LifeExpectancy FROM country WHERE Population BETWEEN 1000000 AND 5000000;

-- 6.
SELECT Name FROM country
JOIN countrylanguage ON country.code = countrylanguage.CountryCode
WHERE countrylanguage.Language = "French" AND countrylanguage.IsOfficial = "T";

-- Chinook
-- 7.
SELECT Album.Title FROM Album 
JOIN Artist ON  Album.ArtistId = Artist.ArtistId
WHERE Artist.Name = "AC/DC";

-- 8.
SELECT FirstName, LastName, Email from Customer WHERE Country = "Brazil";

-- 9.
SELECT Name FROM Playlist;

-- 10.
SELECT COUNT(*) FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = "Rock";

-- 11.
SELECT Employee.FirstName, Employee.LastName FROM Employee
WHERE Employee.ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = "Nancy" AND LastName = "Edwards");

-- 12.
SELECT Customer.CustomerId, SUM(Invoice.Total) AS TotalSales FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId;

-- Part 2
-- Create Flavors table
CREATE TABLE Flavors (
    FlavorID INT PRIMARY KEY,
    FlavorName VARCHAR(50),
    Description TEXT,
    Price DECIMAL(5, 2)
);

-- Flavors table data
INSERT INTO Flavors (FlavorID, FlavorName, Description, Price) VALUES
(1, 'Vanilla', 'Classic vanilla ice cream', 3.50),
(2, 'Chocolate', 'Rich dark chocolate flavor', 3.75),
(3, 'Strawberry', 'Ice cream with fresh chunks of strawverry', 3.60),
(4, 'Mint Chocolate Chip', 'Cool mint ice cream with chocolate chips', 4.00),
(5, 'Cookie Dough', 'Sweet vanilla with chunks of cookie dough', 4.25);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Customers table data
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone) VALUES
(1, 'John', 'Doe', 'johndoe@gmail.com', '123-456-7890'),
(2, 'Jane', 'Doe', 'janedoe@gmail.com', '246-236-8235'),
(3, 'John', 'Cena', 'Johncena@gmail.com', '313-347-3458'),
(4, 'Jo', 'Wilson', 'jowilson@gmail.com', '234-634-4264'),
(5, 'Charlie', 'Brown', 'charliebrown@gmail.com', '753-457-1347');

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FlavorID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (FlavorID) REFERENCES Flavors(FlavorID)
);

-- Orders table data
INSERT INTO Orders (OrderID, CustomerID, FlavorID, Quantity, OrderDate) VALUES
(1, 1, 1, 2, '2024-01-01'),
(2, 2, 3, 1, '2024-02-02'),
(3, 3, 5, 3, '2024-03-03'),
(4, 4, 2, 1, '2024-04-04'),
(5, 5, 4, 2, '2024-05-05');

-- Query 1: First and last name of customer 1
SELECT FirstName, LastName FROM Customers WHERE CustomerID = 1;

-- Query 2: All flavors and their descriptions
SELECT FlavorName, Description FROM Flavors;

-- Query 3: Email and phone of customer 2 and 3
SELECT Email, Phone FROM Customers
WHERE CustomerID = 2 OR CustomerID = 3;