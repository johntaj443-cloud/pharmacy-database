-- Pharmacy Database: sample data (Microsoft Access SQL dialect, #date# literals)
-- Insert in this order so foreign keys resolve.

INSERT INTO Pharmacy (PharmacyID, BusinessName, Address, PhoneNumber) VALUES
(1, 'WellCare Pharmacy', '123 Main St', '718-555-1234'),
(2, 'HealthPlus Pharmacy', '456 Broadway', '718-555-2345'),
(3, 'MediCenter RX', '789 Elm St', '718-555-3456'),
(4, 'GreenLeaf Pharmacy', '101 Pine Ave', '718-555-4567');

INSERT INTO Physician (PhysicianID, Name, PhoneNumber, Address) VALUES
(1, 'Dr. Alice Morgan', '212-555-0001', '45 Health Ave'),
(2, 'Dr. James Chen', '212-555-0002', '67 Clinic Rd'),
(3, 'Dr. Sandra Patel', '212-555-0003', '89 Wellness Blvd'),
(4, 'Dr. Michael Reyes', '212-555-0004', '123 Cure St');

INSERT INTO Customer (CustomerID, Name, DOB, Address, PhysicianID) VALUES
(1, 'John Doe', #1985-07-15#, '789 Oak Dr', 1),
(2, 'Jane Smith', #1990-03-12#, '101 Maple St', 2),
(3, 'Carlos Rivera', #1978-11-05#, '202 Birch Rd', 3),
(4, 'Aisha Khan', #2000-06-22#, '303 Cedar Ln', 4),
(5, 'Emma Liu', #1995-09-30#, '404 Walnut Ave', 1);

INSERT INTO Technician (TechnicianID, PharmacyID, Name, DOB) VALUES
(1, 1, 'Sarah Blake', #1990-02-20#),
(2, 2, 'Liam O''Connor', #1988-05-10#),
(3, 3, 'Priya Desai', #1993-08-14#),
(4, 4, 'Jordan Lee', #1996-01-30#);

INSERT INTO Item (ItemID, ItemName, Description, ExpirationDate, UnitPrice) VALUES
(1, 'Ibuprofen 200mg', 'Pain reliever', #2028-12-31#, 9.99),
(2, 'Amoxicillin 500mg', 'Antibiotic', #2027-10-15#, 14.99),
(3, 'Lisinopril 10mg', 'Blood pressure control', #2027-06-01#, 19.75),
(4, 'Cetirizine 10mg', 'Allergy relief', #2027-03-20#, 7.25),
(5, 'Metformin 850mg', 'Diabetes treatment', #2027-08-10#, 11.50);

INSERT INTO Prescription (PrescriptionID, CustomerID, TechnicianID, ItemID, Quantity) VALUES
(1, 1, 1, 1, 2), -- John Doe: Ibuprofen, filled by Sarah Blake
(2, 2, 2, 2, 1), -- Jane Smith: Amoxicillin, filled by Liam O'Connor
(3, 3, 3, 3, 3), -- Carlos Rivera: Lisinopril, filled by Priya Desai
(4, 4, 4, 4, 1), -- Aisha Khan: Cetirizine, filled by Jordan Lee
(5, 5, 1, 5, 2), -- Emma Liu: Metformin, filled by Sarah Blake
(6, 1, 2, 2, 1); -- John Doe: Amoxicillin, filled by Liam O'Connor
