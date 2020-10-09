-- inner sub query is using data/relation from outer query correlated
--  sub-queries will run for every single record of main query


-- This query will return name and salary of employee whose salary 
-- is greater then department wise avg salary
SELECT first_name, salary
FROM employees e1
WHERE e1.salary > (SELECT ROUND(AVG(salary))
					FROM employees e2
					WHERE e1.department =  e2.department);


--  get the name of the department which has less then 38 employee working

SELECT department
FROM departments d
WHERE 38 < (
		SELECT count(*) 
		FROM employees e
		WHERE e.department = d.department and count(*) > 38
	);


-- get the highest salary per department
SELECT department, (SELECT MAX(salary) 
					FROM employees e
					WHERE e.department = d.department
				 )
FROM departments d;

