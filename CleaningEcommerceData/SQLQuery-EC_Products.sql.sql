--Delete Duplicate Rows
WITH RowNumCTE as(
  SELECT 
    ProductName, 
    QuantityPerUnit, 
    ROW_NUMBER() OVER(
      PARTITION BY QuantityPerUnit 
      ORDER BY 
        QuantityPerUnit
    ) row_num 
  FROM 
    Products
) 
DELETE FROM 
  RowNumCTE 
WHERE 
  row_num > 1 

--Clean data with CASE Statements
SELECT 
  QuantityPerUnit, 
  CASE WHEN UnitsOnOrder > 50 
  and UnitsInStock < 20 then 'Restock Now' WHEN UnitsOnOrder between 30 
  and 50 
  and UnitsInStock < 20 THEN 'Restock Next Week' WHEN UnitsOnOrder between 30 
  and 50 
  and UnitsInStock < 50 THEN 'Restock Next Month' WHEN UnitsOnOrder < 30 
  and UnitsInStock < 50 THEN 'Restock in 6 Months' ELSE 'Ask Manager' End as WhenToRestock 
FROM 
  Products 

ALTER TABLE 
  Products 
ADD 
  WhenToRestock VARCHAR(250) 

UPDATE 
  Products 
SET 
  WhenToRestock = CASE WHEN UnitsOnOrder > 50 
  and UnitsInStock < 20 then 'Restock Now' WHEN UnitsOnOrder between 30 
  and 50 
  and UnitsInStock < 20 THEN 'Restock Next Week' WHEN UnitsOnOrder between 30 
  and 50 
  and UnitsInStock < 50 THEN 'Restock Next Month' WHEN UnitsOnOrder < 30 
  and UnitsInStock < 50 THEN 'Restock in 6 Months' ELSE 'Ask Manager' End 

SELECT 
  * 
FROM 
  Products
