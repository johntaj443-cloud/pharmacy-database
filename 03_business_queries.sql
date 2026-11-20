-- Business Query 1: Most frequently prescribed medications
-- Business question: Which medications are in highest demand?
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

-- Business Query 2: Total revenue by pharmacy
-- Business question: Which pharmacies generate the most revenue from dispensed medications?
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
