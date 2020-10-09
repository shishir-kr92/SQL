-- SUBSTRING ->  extract substring
SELECT ('THIS IS TEST COLUMN'), 
		SUBSTRING('THIS IS TEST COLUMN' FROM 1 FOR 9),  
		SUBSTRING('THIS IS TEST COLUMN', 1, 9)


-- REPLACE -> replace string 
SELECT 
	department, 
	REPLACE(department, 'Clothing', 'test')
FROM departments


SELECT 
	department, 
	CONCAT(department, ' ', 'department')
FROM departments;

SELECT 
	email,
	REPLACE(department, 'Clothing', 'Attire') modified_data
FROM departments


SELECT
	department,
	REPLACE(department, department, CONCAT(department, ' ', 'department'))
FROM department


-- replace each department name with department + " department"
-- Toy --> Toy Department
SELECT
	department,
	REPLACE(department, department, CONCAT(department, ' ', 'department')) replaced_column,
	department || ' ' || 'Department' "new column"
FROM departments;


-- POSITION
-- use to get the position of character in the string

-- this will get us domain name for every records
SELECT email,
	   POSITION('@' IN email),
	   SUBSTRING(EMAIL, POSITION('@' IN email))
FROM employees
WHERE email IS NOT NULL;


-- COALESCE
-- Return first non null expression from the list
SELECT email, COALESCE(email, 'test@gmail.com')
FROM EMPLOYEES