-- first_name, email of female employee from Tools department having salary greater then 110000
SELECT first_name, email, department, gender, salary
FROM employees
WHERE gender = 'F' AND department = 'Tools' AND salary >= 110000;


-- first_name, hire_date of employees having salary 165000 as well as those who works for
-- sports department and are men
SELECT first_name, hire_date, salary, department, gender
FROM employees
WHERE salary > 165000 or (department = 'Sports' and gender = 'M')
ORDER BY salary DESC;

-- first_name, hire_date of employees who were hired during Jan 1st 2002 and Jan 1st 2004
SELECT first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2002-01-01' AND '2004-01-01'
ORDER BY hire_date;


-- male employees who work in the automotive department and earn more than 40000 and less than
-- 100000 as well as females that works in the toys department.

SELECT first_name, last_name, salary, gender, department
FROM employees
WHERE(
		gender = 'M' AND
		department = 'Automotive' AND
		salary BETWEEN 40000 AND 100000
	)
OR (gender = 'F' AND department = 'Toys')


SELECT first_name, last_name, salary, gender, department
FROM employees
WHERE(
		gender = 'M' AND
		department = 'Automotive' AND
		salary > 40000 AND salary < 100000
	)
OR (gender = 'F' AND department = 'Toys')
