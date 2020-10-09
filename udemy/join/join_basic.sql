-- INNER


-- generate report having first_name, email, division for each employee 
-- and email should not be NULL

SELECT e.first_name, e.email, d.division
FROM employees e, departments 
WHERE e.department = d.department AND email IS NOT NULL

SELECT e.first_name, e.email,  d.division
FROM employees e
INNER JOIN departments d
ON e.department = d.department
WHERE email IS NOT NULL


-- generate report having region and number of people working in that region

SELECT r.region, temp.emp_count
FROM regions r, (SELECT region_id, count(employee_id) as emp_count FROM employees GROUP BY region_id) AS temp
WHERE r.region_id = temp.region_id


SELECT r.region, temp.emp_count
FROM regions r
INNER JOIN (SELECT region_id, count(employee_id) as emp_count FROM employees GROUP BY region_id) AS temp
ON r.region_id = temp.region_id

SELECT r.region, COUNT(e.employee_id)
FROM employees e
INNER JOIN   regions r
ON e.region_id = r.region_id
GROUP BY R.region


-- generate report having country and number of people working in that  country

SELECT r.country, count(e.employee_id)
FROM  employees e, regions r
WHERE r.region_id = temp.region_id
GROUP BY country

SELECT r.country, count(e.employee_id)
FROM employees e
INNER JOIN region r
ON e.region_id = r.region_id
GROUP BY r.country