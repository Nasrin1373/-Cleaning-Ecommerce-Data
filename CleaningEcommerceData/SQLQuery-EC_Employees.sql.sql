--Delete NULLs Value
SELECT 
  LastName, 
  FirstName, 
  ISNULL(Region, 'No Rgion') as Region 
FROM 
  Employees 

UPDATE 
  Employees 
SET 
  Region = ISNULL(Region, 'No Rgion') 

SELECT 
  LastName, 
  FirstName, 
  ISNULL(ReportsTo, 0) as ReportsTo 
FROM 
  Employees 

UPDATE 
  Employees 
SET 
  ReportsTo = ISNULL(ReportsTo, 0) 

--Standardize the format of the day

SELECT 
  BirthDate, 
  CONVERT(DATE, BirthDate) as ConvertedBirthDate 
FROM 
  Employees 

ALTER TABLE 
  Employees 
ADD 
  ConvertedBirthDate DATE 

Update 
  Employees 
SET 
  ConvertedBirthDate = CONVERT(DATE, BirthDate) 

ALTER TABLE 
  Employees 
DROP 
  COLUMN BirthDate 

--Standardize the format of the day
SELECT 
  HireDate, 
  CONVERT(DATE, HireDate) as ConvertedHireDate 
FROM 
  Employees 

ALTER TABLE 
  Employees 
ADD 
  ConvertedHireDate DATE 

Update 
  Employees 
SET 
  ConvertedHireDate = CONVERT(DATE, HireDate) 

ALTER TABLE 
  Employees 
DROP 
  COLUMN HireDate 

SELECT 
  * 
FROM 
  Employees
