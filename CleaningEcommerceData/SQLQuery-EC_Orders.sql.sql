-- Delete duplicate rows
WITH RowNumCTE as(
  SELECT 
    *, 
    ROW_NUMBER() OVER (
      partition by CustomerID 
      ORDER BY 
        CustomerID
    ) as RowNum 
  FROM 
    Orders
) 

SELECT 
  * 
FROM 
  RowNumCTE 
WHERE 
  RowNum > 1 

--Clean Data with CASE Statements
SELECT 
  Freight, 
  CASE WHEN Freight < 50 THEN 'Low Charge' WHEN Freight between 50 
  and 200 THEN 'Medium Charge' WHEN Freight > 200 THEN 'High Charge' Else 'Small Charge' End as Charge 
FROM 
  Orders 

ALTER TABLE 
  Orders 
Add 
  Charge Nvarchar(255);

Update 
  Orders 
SET 
  Charge = CASE WHEN Freight < 50 THEN 'Low Charge' WHEN Freight between 50 
  and 200 THEN 'Medium Charge' WHEN Freight > 200 THEN 'High Charge' Else 'Small Charge' End;

SELECT 
  * 
FROM 
  Orders 
WHERE 
  Charge = 'Small Charge' 

--Delete NULL value

SELECT 
  ShipName, 
  ShipAddress, 
  ISNULL(ShipRegion, 'No Region') as ShipRegion 
FROM 
  Orders 

UPDATE 
  Orders 
SET 
  ShipRegion = ISNULL(ShipRegion, 'No Region') 

SELECT 
  * 
FROM 
  Orders 
WHERE 
  ShipRegion = NULL
