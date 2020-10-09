-- MAX
-- give max value for the column

-- MIN
-- give min value for the column

-- AVG
-- give min value for the column

-- ROUND 
-- round a number to specific  number of decimal places

-- FLOOR
-- floor value

-- CEILLING
-- ceiling value

SELECT MIN(salary), 
	   MAX(salary), 
	   AVG(salary), 
	   ROUND(AVG(salary), 2),
	   FLOOR(AVG(salary)),
	   CEILLING(AVG(salary))
FROM employees;


-- COUNT
-- count number of record

SELECT count(employee_id) 
FROM employees;

-- SUM
-- add all value for the columns
SELECT sum(salary) 
FROM employees