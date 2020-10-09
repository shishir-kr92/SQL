


-- generate report that contain department and employees that contain min
-- and max salary for that department


SELECT department, first_name, salary, 
CASE WHEN salary = temp.max_salary THEN 'MAX SALARY'
	 WHEN salary = temp.min_salary THEN 'MIN SALARY'
END AS salary_in_department
FROM (
SELECT department, first_name, salary,
	(SELECT max(salary) FROM employees e2 WHERE e1.department = e2.department) max_salary,
	(SELECT min(salary) FROM employees e2 WHERE e1.department = e2.department) min_salary
FROM employees e1
) temp
WHERE temp.salary = temp.max_salary OR temp.salary = temp.min_salary
ORDER BY department




SELECT department, first_name, salary, 
CASE WHEN rnk_min = 1 THEN 'LOWEST SALARY'
	 WHEN rnk_max = 1 THEN 'HIGHEST SALARY'
END AS salary_as_department
FROM ( 
SELECT department,first_name, salary,
	rank() over (partition by department ORDER BY salary DESC) rnk_max,
	rank() over (partition by department  ORDER BY salary ASC) rnk_min
FROM employees) e
WHERE rnk_min = 1 OR rnk_max = 1

--    | department         |first_name		  |salary   |salary_as_department |
--	   _______________________________________________________________________
--    |"Automotive"	       |"Laurie"	      |29752	|"LOWEST SALARY"      |
--    |"Automotive"	       |"Mill"	          |162522	|"HIGHEST SALARY"     |
--    |"Beauty"	           |"Willabella"      |22053	|"LOWEST SALARY"      |
--    |"Beauty"	           |"Orland"	      |162845	|"HIGHEST SALARY"     |
--    |"Books"	           |"Chloris"	      |41549	|"LOWEST SALARY"      |
--    |"Books"	           |"Sephira"	      |159561	|"HIGHEST SALARY"     |
--    |"Children Clothing" |"Timotheus"	      |23159	|"LOWEST SALARY"      |
--     ------------------------------------------------------------------------
