-- UPPER/LOWER -> convert to upper/lower case
SELECT UPPER(first_name), LOWER(last_name)
FROM employees


-- LENGTH -> get length of string
SELECT first_name, LENGTH(first_name)
FROM employees


-- TRIM -> remove leading and trailing white spaced
SELECT TRIM('     HELLO WORLD     ')


-- CONCAT -> concatenate two columns
SELECT CONCAT(first_name, ' ' last_name) AS full_name
FROM  employees

SELECT first_name || last_name AS full_name
FROM  employees


-- CONCAT_WS -> concatenate with specific delimiter
SELECT CONCAT_WS('|', first_name, last_name, email) AS details
FROM  employees


-- add new boolean column
SELECT CONCAT(first_name, last_name) AS full_name, (salary > 40000)
FROM employees
