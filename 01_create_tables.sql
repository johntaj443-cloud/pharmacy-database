-- Pharmacy Database: table definitions (Microsoft Access SQL dialect)
-- Run order: 01_create_tables.sql -> 02_sample_data.sql -> 03_business_queries.sql

CREATE TABLE Pharmacy (
     PharmacyID AUTOINCREMENT PRIMARY KEY
     , BusinessName TEXT
     , Address TEXT
     , PhoneNumber TEXT
);

CREATE TABLE Physician (
     PhysicianID AUTOINCREMENT PRIMARY KEY
     , Name TEXT
     , PhoneNumber TEXT
     , Address TEXT
);

CREATE TABLE Customer (
     CustomerID AUTOINCREMENT PRIMARY KEY
     , Name TEXT
     , DOB DATE
     , Address TEXT
     , PhysicianID LONG
     , FOREIGN KEY (PhysicianID) REFERENCES Physician (PhysicianID)
);

CREATE TABLE Technician (
     TechnicianID AUTOINCREMENT PRIMARY KEY
     , PharmacyID LONG
     , Name TEXT
     , DOB DATE
     , FOREIGN KEY (PharmacyID) REFERENCES Pharmacy (PharmacyID)
);

CREATE TABLE Item (
     ItemID AUTOINCREMENT PRIMARY KEY
     , ItemName TEXT
     , Description TEXT
     , ExpirationDate DATE
     , UnitPrice CURRENCY
);

CREATE TABLE Prescription (
     PrescriptionID AUTOINCREMENT PRIMARY KEY
     , CustomerID LONG
     , TechnicianID LONG
     , ItemID LONG
     , Quantity INTEGER
     , FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
     , FOREIGN KEY (TechnicianID) REFERENCES Technician (TechnicianID)
     , FOREIGN KEY (ItemID) REFERENCES Item (ItemID)
);
