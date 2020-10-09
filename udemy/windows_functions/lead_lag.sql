-- LEAD
SELECT first_name. last_name, salary,
LEAD(salary) OVER() previous_salary
FROM employees


-- LAG
SELECT first_name. last_name, salary,
LAG(salary) OVER() previous_salary
FROM employees



-- LEAD
SELECT first_name, last_name, department ,salary,
LAG(salary) OVER(partition by department order by salary desc) closest_higher_salary
FROM employees