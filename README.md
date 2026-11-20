# Pharmacy Database

A relational database design for a pharmacy system, covering entity-relationship modeling, SQL schema creation, sample data, and business queries.

## Overview

The database tracks pharmacies, the technicians who work at them, physicians, customers, medication inventory, and the prescriptions that connect them. It is built in Microsoft Access SQL.

## ER Diagram

![Pharmacy ER diagram](images/er_diagram.png)

## Tables and Relationships

| Table | Purpose | Key relationships |
|---|---|---|
| **Pharmacy** | Pharmacy locations | One pharmacy employs many technicians |
| **Physician** | Prescribing physicians | One physician has many customers |
| **Customer** | Patients | Belongs to one physician; receives many prescriptions |
| **Technician** | Pharmacy staff who fill prescriptions | Works at one pharmacy; fills many prescriptions |
| **Item** | Medications (name, description, expiration date, unit price) | One item appears on many prescriptions |
| **Prescription** | Links a customer, technician, and item with a quantity | Foreign keys to Customer, Technician, and Item |

## Business Queries

**1. Most frequently prescribed medications.** Which medications are in highest demand?

```sql
SELECT
     it.ItemName
     , COUNT(*) AS PrescriptionCount
FROM
     Prescription pr
     LEFT JOIN Item it ON
          it.ItemID = pr.ItemID
GROUP BY
     it.ItemName
ORDER BY
     COUNT(*) DESC;
```

Result on the sample data: Amoxicillin 500mg is the most prescribed (2 prescriptions); the other four medications have 1 each.

**2. Total revenue by pharmacy.** Which pharmacies generate the most revenue from dispensed medications? Revenue is unit price multiplied by quantity, joined through the technician who filled each prescription.

```sql
SELECT
     ph.BusinessName
     , SUM(it.UnitPrice * pr.Quantity) AS TotalRevenue
FROM
     Prescription pr
     LEFT JOIN Technician te ON
          te.TechnicianID = pr.TechnicianID
     LEFT JOIN Pharmacy ph ON
          ph.PharmacyID = te.PharmacyID
     LEFT JOIN Item it ON
          it.ItemID = pr.ItemID
GROUP BY
     ph.BusinessName
ORDER BY
     SUM(it.UnitPrice * pr.Quantity) DESC;
```

| Pharmacy | Total revenue |
|---|---|
| MediCenter RX | $59.25 |
| WellCare Pharmacy | $42.98 |
| HealthPlus Pharmacy | $29.98 |
| GreenLeaf Pharmacy | $7.25 |

## Files

| File | Description |
|---|---|
| `sql/01_create_tables.sql` | Table definitions with primary and foreign keys |
| `sql/02_sample_data.sql` | Sample records for every table |
| `sql/03_business_queries.sql` | The two business queries above |
| `images/er_diagram.png` | Entity-relationship diagram |

## How to Run

1. Create a blank database in Microsoft Access.
2. Run the three SQL files in order (01, 02, 03) from the Query Designer's SQL view. Access runs one statement at a time, so execute each `CREATE TABLE` and `INSERT` separately.

## Skills Demonstrated

Entity-relationship modeling, relational schema design, primary and foreign keys, multi-table joins, aggregation (`COUNT`, `SUM`, `GROUP BY`), and translating business questions into SQL.
