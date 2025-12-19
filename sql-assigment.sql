create database contactmanagment;
use contactmanagment;

-- company table
create table company
(
companyID int,
companyname varchar(15),
street varchar(30),
city varchar(20),
state varchar(15),
zip int
);

INSERT INTO Company (companyID, companyname, street, city, state, zip)
VALUES
(1, 'UrbanOutfitters', 'Nariman Point', 'Mumbai', 'Maharashtra', 400021),
(2, 'Infosys Ltd', 'Electronics City', 'Bengaluru', 'Karnataka', 560100),
(3, 'Reliance Retail', 'Maker Chambers', 'Mumbai', 'Maharashtra', 400021),
(4, 'Wipro Limited', 'Sarjapur Road', 'Bengaluru', 'Karnataka', 560035),
(5, 'HDFC Bank', 'Ashram Road', 'Ahmedabad', 'Gujarat', 380009);
select * from company;

-- contact table
create table contact(
    ContactID INT PRIMARY KEY,
    CompanyID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Street VARCHAR(45),
    City VARCHAR(45),
    State VARCHAR(2),
    Zip int,
    IsMain BOOLEAN,
    Email VARCHAR(45),
    Phone int
);
ALTER TABLE Contact MODIFY Phone VARCHAR(15);

INSERT INTO Contact
(ContactID, CompanyID, FirstName, LastName, Street, City, State, Zip, IsMain, Email, Phone)
VALUES
(1, 101, 'Amit', 'Shah', 'Ashram Road', 'Ahmedabad', 'GJ', 380009, TRUE,  'amit.shah@company.com','9876543210'),
(2, 102, 'tarak', 'mehta', 'MG Road', 'Bengaluru', 'KA', 560001, FALSE, 'rohit.verma@company.com','9123456780'),
(3, 103, 'Neha', 'Patel', 'C G Road', 'Ahmedabad', 'GJ', 380006, TRUE,  'neha.patel@company.com','9988776655'),
(4, 104, 'Suresh', 'Kumar', 'Anna Nagar', 'Chennai', 'TN', 600040, FALSE, 'suresh.kumar@company.com','9012345678'),
(5, 105, 'Pooja', 'Mehta', 'Linking Road', 'Mumbai', 'MH', 400050, TRUE,  'pooja.mehta@company.com','9090909090');
select * from contact;

-- employee table
create table Employee(
    EmployeeID INT,
    FirstName VARCHAR(45),
    LastName VARCHAR(45),
    Salary DECIMAL(10,2),
    HireDate DATE,
    JobTitle VARCHAR(25),
    Email VARCHAR(45),
    Phone varchar(10)
);
INSERT INTO Employee
(EmployeeID, FirstName, LastName, Salary, HireDate, JobTitle, Email, Phone)
VALUES
(101,  'Lesley','Bland', 45000.00, '2021-06-15', 'Software Engg', 'rakesh.patel@company.com', 987654321),
(102, 'Dianne', 'Connor’s', 52000.50, '2020-03-10', 'Data Analyst', 'sneha.sharma@company.com', 912345678),
(103, 'Amit', 'Verma', 60000.00, '2019-11-25', 'Project Lead', 'amit.verma@company.com', 998877665),
(104, 'Kiran', 'Desai', 48000.75, '2022-01-05', 'HR Executive', 'kiran.desai@company.com', 901234567),
(105, 'Pooja', 'Mehta', 55000.00, '2018-08-18', 'System Admin', 'pooja.mehta@company.com', 909090909);
select * from employee;
ALTER TABLE Employee ADD PRIMARY KEY (EmployeeID);

-- contactemployee table
create table ContactEmploye(
    ContactEmployeeID INT PRIMARY KEY,
    ContactID INT,
    EmployeeID INT,
    ContactDate DATE,
    Description VARCHAR(100),
    FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
INSERT INTO ContactEmploye
(ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description)
VALUES
(1, 1, 101, '2024-01-10', 'Initial business discussion'),
(2, 2, 102, '2024-02-15', ' Jack Lee'),
(3, 3, 103, '2024-03-05', 'Project requirement clarification'),
(4, 4, 104, '2024-04-20', 'HR policy discussion'),
(5, 5, 105, '2024-05-12', 'System maintenance support');
ALTER TABLE employee MODIFY Phone VARCHAR(15);


-- quries number 4
UPDATE Employee set Phone = '215-555-8800' WHERE FirstName= 'lesley';
select * from employee;
ALTER TABLE company MODIFY companyname VARCHAR(20);

-- quries number 5
update company set companyname='UrbanOutfittersInc' where companyname='UrbanOutfitters';
select * from company;

-- quries number 6
DELETE FROM ContactEmploye WHERE ContactEmployeeID = 2;
select * from contactEmploye;

