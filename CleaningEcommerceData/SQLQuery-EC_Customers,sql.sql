--Delete NULLs value in Rgion column
SELECT 
  CustomerID, 
  ContactName, 
  City, 
  Region, 
  ISNULL(Region, 'No Region') as Region 
FROM 
  Customers 

UPDATE 
  Customers 
SET 
  Region = ISNULL(Region, 'No Region') 

SELECT 
  Region 
FROM 
  Customers 
WHERE 
  Region = 'No Region' 

--Delete NULLs value in ConvertedFax column
SELECT 
  CustomerID, 
  ContactName, 
  City, 
  Fax, 
  ISNULL(Fax, 'No Fax') as Fax 
FROM 
  Customers 

UPDATE 
  Customers 
SET 
  Fax = ISNULL(Fax, 'No Fax') 

SELECT 
  Fax 
FROM 
  Customers 
WHERE 
  Fax = 'No Fax' 

--Standardize phone numbers
SELECT 
  CASE
  WHEN Phone LIKE '___-_______' THEN CONCAT(
    '(', 
    SUBSTRING(Phone, 1, 3), 
    ') ', 
    SUBSTRING(Phone, 5, 3), 
    '-', 
    SUBSTRING(Phone, 8, 4)
  ) 
  WHEN Phone LIKE '____-__ __ __ __' THEN CONCAT(
    '(', 
    SUBSTRING(Phone, 1, 3), 
    ') ', 
    SUBSTRING(Phone, 5, 2), 
    '-', 
    SUBSTRING(Phone, 8, 4)
  ) 
  WHEN Phone LIKE '____-_____' THEN CONCAT(
    '(', 
    SUBSTRING(Phone, 1, 2), 
    ') ', 
    SUBSTRING(Phone, 3, 3), 
    '-', 
    SUBSTRING(Phone, 7, 4)
  ) 
  WHEN Phone LIKE '(_) __-__-__' THEN CONCAT(
    SUBSTRING(Phone, 1, 8), 
    SUBSTRING(Phone, 11, 2)
  ) ELSE Phone -- Leave other formats as is
  END AS ConvertedPhon 
FROM 
  Customers;

ALTER TABLE 
  Customers 
ADD 
  ConvertedPhon VARCHAR(22) 

UPDATE 
  Customers 
SET 
  ConvertedPhon = CASE 
  WHEN Phone LIKE '___-_______' THEN CONCAT(
    '(', 
    SUBSTRING(Phone, 1, 3), 
    ') ', 
    SUBSTRING(Phone, 5, 3), 
    '-', 
    SUBSTRING(Phone, 8, 4)
  ) 
  WHEN Phone LIKE '____-__ __ __ __' THEN CONCAT(
    '(', 
    SUBSTRING(Phone, 1, 3), 
    ') ', 
    SUBSTRING(Phone, 5, 2), 
    '-', 
    SUBSTRING(Phone, 8, 4)
  )
  WHEN Phone LIKE '____-_____' THEN CONCAT(
    '(', 
    SUBSTRING(Phone, 1, 2), 
    ') ', 
    SUBSTRING(Phone, 3, 3), 
    '-', 
    SUBSTRING(Phone, 7, 4)
  ) 
  WHEN Phone LIKE '(_) __-__-__' THEN CONCAT(
    SUBSTRING(Phone, 1, 8), 
    SUBSTRING(Phone, 11, 2)
  ) ELSE Phone -- Leave other formats as is
  END 

ALTER TABLE 
  Customers 
DROP 
  COLUMN Phone 

--Standardize Fax numbers
SELECT 
  CASE
  WHEN Fax LIKE '___-_______' THEN CONCAT(
    '(', 
    SUBSTRING(Fax, 1, 3), 
    ') ', 
    SUBSTRING(Fax, 5, 3), 
    '-', 
    SUBSTRING(Fax, 8, 4)
  )
  WHEN Fax LIKE '____-__ __ __ __' THEN CONCAT(
    '(', 
    SUBSTRING(Fax, 1, 3), 
    ') ', 
    SUBSTRING(Fax, 5, 2), 
    '-', 
    SUBSTRING(Fax, 8, 4)
  ) 
  WHEN Fax LIKE '____-_____' THEN CONCAT(
    '(', 
    SUBSTRING(Fax, 1, 2), 
    ') ', 
    SUBSTRING(Fax, 3, 3), 
    '-', 
    SUBSTRING(Fax, 7, 4)
  ) 
  WHEN Fax LIKE '(_) __-__-__' THEN CONCAT(
    SUBSTRING(Fax, 1, 8), 
    SUBSTRING(Fax, 11, 2)
  ) ELSE Fax -- Leave other formats as is
  END AS ConvertedFax 
FROM 
  Customers;

ALTER TABLE 
  Customers 
ADD 
  ConvertedFax VARCHAR(22) 

UPDATE 
  Customers 
SET 
  ConvertedFax = CASE
  WHEN Fax LIKE '___-_______' THEN CONCAT(
    '(', 
    SUBSTRING(Fax, 1, 3), 
    ') ', 
    SUBSTRING(Fax, 5, 3), 
    '-', 
    SUBSTRING(Fax, 8, 4)
  )
  WHEN Fax LIKE '____-__ __ __ __' THEN CONCAT(
    '(', 
    SUBSTRING(Fax, 1, 3), 
    ') ', 
    SUBSTRING(Fax, 5, 2), 
    '-', 
    SUBSTRING(Fax, 8, 4)
  )
  WHEN Fax LIKE '____-_____' THEN CONCAT(
    '(', 
    SUBSTRING(Fax, 1, 2), 
    ') ', 
    SUBSTRING(Fax, 3, 3), 
    '-', 
    SUBSTRING(Fax, 7, 4)
  ) 
  WHEN Fax LIKE '(_) __-__-__' THEN CONCAT(
    SUBSTRING(Fax, 1, 8), 
    SUBSTRING(Fax, 11, 2)
  ) ELSE Fax -- Leave other formats as is
  END 

ALTER TABLE 
  Customers 
DROP 
  COLUMN Fax 

SELECT 
  * 
FROM 
  Customers
