


-- RANK
SELECT first_name, department, hire_date, salary,
RANK() OVER(PARTITION BY department ORDER BY salary  )  AS r
FROM employees





-- get second highest salary from each department
-- give rank to all the rows in a partition
SELECT * FROM (
	SELECT first_name, department, hire_date, salary,
	RANK() OVER(PARTITION BY department ORDER BY salary  )  AS r
	FROM employees) e2
WHERE e2.r = 2



-- NTILES
-- it will break entire partition into n number of buckets 
SELECT first_name, department, hire_date, salary,
NTILE(5) OVER(PARTITION BY department ORDER BY salary  )  AS r
FROM employees



-- FIRST_VALUE
-- it will take first value of each partition  and will apply it to all records for that PARTITION
SELECT first_name, department, hire_date, salary,
FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary  )  AS r
FROM employees


-- nth_value
SELECT first_name, department, hire_date, salary,
NTH_VALUE(salary, 3) OVER(PARTITION BY department ORDER BY salary  )  AS r
FROM employees