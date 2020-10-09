
CREATE VIEW v_employee_info AS
SELECT 
	first_name, 
	email, 
	e.department, 
	salary, 
	divisions, 
	region, 
	country
FROM employees e, 
     departments d,
     regions r
WHERE 
	e.department = d.department AND
	e.region_id = r.region_id
;



SELECT * FROM v_employee_info;



-- inline views

SELECT * FROM (SELECT * FROM department)