-- ORDER BY

# ascending order
# default order is ascending
SELECT * 
FROM employees
ORDER BY employee_id ASC;

# descending order
SELECT * 
FROM employees
ORDER BY employee_id DESC;


-- DISTINCT
SELECT DISTINCT department
FROM employees
ORDER BY 1;

-- LIMIT
SELECT DISTINCT department
FROM employees
ORDER BY 1
LIMIT 10;

-- FETCH FIRST
SELECT DISTINCT department
FROM employees
ORDER BY 1
FETCH FIRST 10 ROWS ONLY;

-- AS
SELECT DISTINCT department AS sorted_department
FROM employees
ORDER BY 1
LIMIT 10;



