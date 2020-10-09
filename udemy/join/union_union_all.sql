-- UNION 

-- stack data from one table to another
-- remove duplicate records and consider only unique records from
-- both table

SELECT department
FROM employees
UNION
SELECT department
FROM departments


-- UNION ALL
-- same as UNION
-- does not remove duplicate entries

SELECT DISTINCT department
FROM employees
UNION ALL
SELECT department
FROM departments

-- NOTES: in both UNION and UNION ALL in both tables number of columns should match as well
--        as there data type should match


-- EXCEPT
-- take first result set and remove all the rows from second result set that exist in first result set

SELECT DISTINCT department
FROM employees
EXCEPT
SELECT department
FROM departments


-- get employees  count working for each department and total number of employees working
SELECT department, count(employee_id)
FROM employees
GROUP BY department
UNION
SELECT "TOTAL", count(*)
FROM employees
