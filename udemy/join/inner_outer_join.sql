-- INNER Join
-- inner join will give records whose key exist in both table
SELECT e.first_name, e.email, d.department, d.division
FROM employees e
INNER JOIN departments d
ON e.department = d.department


-- LEFT JOIN/LEFT OUTER JOIN

SELECT DISTINCT e.department, d.department
FROM employees e 
INNER JOIN department d
ON e.department = d.department


-- RIGHT JOIN/ RIGHT OUTER JOIN
SELECT DISTINCT e.department, d.department
FROM employees e
RIGHT JOIN departments d
ON e.department = d.department


-- FULL OUTER JOIN
SELECT DISTINCT e.department, d.department
FROM employees e
FULL OUTER JOIN departments d
ON e.department = d.department



-- Get the list of departments that exist in employees table but 
-- does not exist in departments table
SELECT DISTINCT e.department
FROM employees e
LEFT JOIN departments d
ON e.department = d.department
WHERE d.department is null