-- grouping data based on column

SELECT department, MIN(salary), MAX(salary), AVG(salary)
FROM employees
WHERE 1 = 1
GROUP BY department


-- filtering out records in aggregation
SELECT department, MIN(salary), MAX(salary), SUM(salary)
FROM employees
WHERE region_id IN (4,5,6)
GROUP BY department


-- total count of employees working in each department
SELECT department, COUNT(employee_id)
FROM employees
GROUP BY department;


-- get min , max, average salary and number of employee per department
SELECT department, 
	   MIN(salary), 
	   MAX(salary), 
	   ROUND(AVG(salary), 3), 
	   COUNT(employee_id)
FROM employees
GROUP BY department
ORDER  BY ROUND(AVG(salary), 3) DESC



-- get min, max, average salary and count of all male and female employees per department
SELECT  department,
		gender,
		MIN(salary) min_salary,
		MAX(salary) max_salary,
		ROUND(AVG(salary)) avg_salary,
		COUNT(employee_id) employee_count
FROM employees
GROUP BY department, gender
ORDER BY department;

-- get all department having employee count less then 35

SELECT department,
	   COUNT(employee_id)
FROM employees
GROUP BY department
HAVING COUNT(employee_id) < 35
ORDER BY 1;


-- NOTES
-- HAVING clause is used to filter aggregate data while WHERE clause is used to filter out records
-- at source 

-- we can give index of column in ORDER BY clause specified in  SELECT query



