
-- partition the data based on department column
SELECT first_name, department, 
COUNT(*) OVER(PARTITION by department)
FROM employees e2


-- partition the data based on department and region_id column
SELECT first_name, department, 
COUNT(*) OVER(PARTITION by department) dept_count,
COUNT(*) OVER(PARTITION by region_id) region_count
FROM employees e2


-- getting running total
SELECT first_name, hire_date, salary,
SUM(salary) OVER(ORDER BY hire_date RANGE BETWEEN UNBOUNDED PRECEDING
			  AND CURRENT ROW) AS running_total_of_salary
FROM employees e2

SELECT first_name, hire_date, salary,
SUM(salary) OVER(ORDER BY hire_date) AS running_total_of_salary
FROM employees e2


-- running total per department
SELECT first_name, hire_date, salary,
SUM(salary) OVER(PARTITION BY department ORDER BY hire_date) AS running_total_of_salary
FROM employees e2


-- get the sum of salary for two adjacent row
SELECT first_name, department, hire_date, salary,
SUM(salary) OVER(ORDER BY hire_date rows between 1 preceding and current row   ) AS running_total_of_salary
FROM employees e2