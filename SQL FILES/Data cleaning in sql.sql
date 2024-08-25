SELECT * FROM employees;
 
-- Missing Values 
SELECT
	employee_id,
	employee_name,
	salary,
	hire_date,
	COALESCE(department, 'Unknown') AS department
FROM employees;

-- Duplicate Records 
SELECT DISTINCT * 
FROM employees;

-- Data Type Conversion 
SELECT
	employee_id,
	employee_name,
	salary,
	CAST("hire_date" as DATE) AS hire_date,
	department
FROM employees;

-- Outliers
SELECT *
FROM employees
WHERE salary > 100000;

-- Inconsistent Data Entry 
SELECT
	employee_id,
	CONCAT(
    	UPPER(SUBSTRING(employee_name, 1, 1)), -- Capitalize the first letter of the first name
    	LOWER(SUBSTRING(employee_name, 2, POSITION(' ' IN employee_name) - 2)), -- Make the rest of the first name lowercase
    	' ',
    	UPPER(SUBSTRING(employee_name, POSITION(' ' IN employee_name) + 1, 1)), -- Capitalize the first letter of the last name
    	LOWER(SUBSTRING(employee_name, POSITION(' ' IN employee_name) + 2)) -- Make the rest of the last name lowercase
	) AS employee_name_title_case,
	salary,
	hire_date,
	department
FROM employees;

-- Validating Ranges 
SELECT
	employee_id,
	employee_name,
	salary,
	hire_date,
	department
FROM employees
WHERE salary < 0 OR salary > 100000;

-- Deriving New Columns
SELECT
	employee_id,
	employee_name,
	salary,
	hire_date,
	department,
-- (CURRENT_DATE - CAST("hire_date" as DATE)) AS years_of_service
    AGE(CURRENT_DATE,CAST("hire_date" as DATE))AS years_of_service
FROM employees;








