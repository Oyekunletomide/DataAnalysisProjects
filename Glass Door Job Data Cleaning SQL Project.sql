**Data Cleaning**

-- Check for null values in all columns

SELECT *
FROM 
	Uncleaned_DS_jobs
WHERE 
	salary_estimate IS NULL OR 
    job_title IS NULL OR 
    rating is NULL OR 
    company_name IS NULL OR 
    location is NULL OR 
	headquarters is NULL OR 
    size is NULL OR 
    founded is NULL or 
    type_of_ownership is NULL OR 
    industry IS NULL OR 
	sector is NULL OR 
    revenue is NULL OR 
    competitors IS NULL;
    

-- Get the distribution  of values in the 'rating' and 'founded' column


SELECT 
	rating, founded, COUNT(*)
from 
	Uncleaned_DS_jobs
GROUP by 
	rating
ORDER BY 
	rating,founded DESC
    
    
-- Replacing values in 'founded' where value is incorrect


UPDATE 
	Uncleaned_DS_jobs
SET
	founded = REPLACE(founded,'-1','2019');
    

--Check for Outliers in 'rating' and 'founded' columns by compairing MAX and MIN value with the AVERAGE

SELECT 
	MIN(rating),
    MAX(rating) 
FROM 
	Uncleaned_DS_jobs
    
SELECT 
	AVG(rating) 
FROM 
	Uncleaned_DS_jobs

SELECT 
	MIN(founded), 
    MAX(founded) 
FROM 
	Uncleaned_DS_jobs
SELECT 
	AVG(founded) 
FROM 
	Uncleaned_DS_jobs
    
--Removing unwanted characters and white spaces from the 'salary_estimate' column
   
   
SELECT
	REPLACE(
      REPLACE(
        REPLACE(salary_estimate,'K',""),'$',""),' (Glassdoor est.)',"") 
AS 
	new_salary_estimate
from 
	Uncleaned_DS_jobs
    

    
