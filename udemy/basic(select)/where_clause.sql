-- where clause if use to filter the records that return true for condition
-- specified with it


-- return records whose salary is less then 10000
SELECT * 
FROM employees
WHERE salary < 10000;



-- always True, return all records
SELECT * 
FROM employees
WHERE 1 = 1;

SELECT * 
FROM employees
WHERE TRUE;

-- always False, return no records
SELECT * 
FROM employees
WHERE FALSE;



-- multiple conditions
-- here all records will have salary greater then 90000 and department will be sports
-- or region_id is 5
SELECT employee_id, first_name, salary, department
FROM employees
WHERE salary > 90000
AND department = 'Sports'
OR region_id = 5
order by salary;


-- here putting both or clause inside parentheses will be evaluated as single clause
-- it will return all records having salary less then 40k and belongs to either
-- clothing or pharmacy department
SELECT employee_id, first_name, salary, department, region_id
FROM employees
WHERE salary < 40000
AND (department = 'Clothing'
OR department = 'Pharmacy')
order by department;


-- it will return 0 records because no records satisfy the condition that there department is clothing 
-- as well as pharmacy at the same time
SELECT employee_id, first_name, salary, department, region_id
FROM employees
WHERE department = 'Clothing'
AND department = 'Pharmacy';



