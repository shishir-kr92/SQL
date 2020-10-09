-- NOT

SELECT employee_id, first_name, salary, department, region_id
FROM employees
WHERE  NOT department  = 'Automotive'
ORDER BY department;


SELECT employee_id, first_name, salary, department, region_id
FROM employees
WHERE  department  != 'Automotive'
ORDER BY department;

SELECT employee_id, first_name, salary, department, region_id
FROM employees
WHERE  department  <> 'Automotive'
ORDER BY department;


-- IS NULL, (IS NOT NULL)/(NOT IS NULL)
-- NULL cannot be compared 
SELECT first_name, email
FROM employees
WHERE email is NULL;


SELECT first_name, email
FROM employees
WHERE email IS NOT NULL;

SELECT first_name, email
FROM employees
WHERE NOT email IS  NULL;




-- IN 
SELECT * 
FROM EMPLOYEES
WHERE DEPARTMENT = 'Sports'
OR   DEPARTMENT = 'Toys';

SELECT * 
FROM EMPLOYEES
WHERE DEPARTMENT IN ('Sports',  'Toys')


-- BETWEEN
-- check value between two range, inclusive
SELECT first_name, salary
FROM employees
WHERE salary BETWEEN 80000 AND 100000
ORDER BY salary;