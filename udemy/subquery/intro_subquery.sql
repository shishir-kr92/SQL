-- sub-query in where clause
SELECT *
FROM EMPLOYEES
WHERE department NO IN (
                            SELECT department FROM department
                        )


-- sub-query in FROM clause
-- for postgres alias is needed for sub-query in FROM clause
SELECT  temp_table.first_name, temp_table.salary
FROM (
        SELECT * 
        FROM employees
        WHERE salary > 150000
    ) temp_table
ORDER BY temp_table.salary DESC


-- sub-query in SELECT clause
-- here limit 1 is mandatory else it will throw error
select first_name, 
       last_name, 
       salary, 
       (select first_name from employees limit 1)
FROM employees


-- replace department with division 
SELECT e.first_name,
	   e.last_name, 
	   e.department, 
	   d.division
from employees as e, 
	(select * from departments) d
where e.department = d.department
ORDER BY e.department 


-- get all employees that are from Electronic devision
SELECT first_name, 
	   last_name, 
	   department
FROM employees
WHERE department IN (
					 SELECT department 
					 FROM departments 
					 WHERE division = 'Electronics'
					) 


-- get all employees that work in Asia and Canada and earn more then 30000$
SELECT first_name, last_name
FROM employees
WHERE region_id IN (SELECT region_id FROM regions WHERE region IN ('Asia', 'Canada'))
AND salary > 30000


-- get all 
