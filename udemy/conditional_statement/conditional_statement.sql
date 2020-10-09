-- CASE-WHEN is used to apply conditional logic

-- create new column based on following condition
-- salary < 10000 'UNDER PAID'
-- salary > 10000 and salary < 160000 'PAID WELL'
-- salary < 10000 'EXCECUTIVE'

SELECT first_name, salary,
CASE
	WHEN salary < 100000 THEN 'UNDER PAID'
	WHEN salary > 100000 AND salary < 160000 THEN 'PAID WELL'
	ELSE 'EXECUTIVE'
END AS category
FROM employees
ORDER BY salary DESC;



-- based in above condition get the count of 'UNDER PAID', 'PAID WELL', EXCECUTIVE'
SELECT t.category, count(t.category)
FROM (
	    SELECT first_name, salary,
	    CASE
	    	WHEN salary < 100000 THEN 'UNDER PAID'
	    	WHEN salary > 100000 AND salary < 160000 THEN 'PAID WELL'
	    	ELSE 'EXECUTIVE'
	    END AS category
	    FROM employees
) t
GROUP BY t.category

-- |"Category"  |   count|
-- |"PAID WELL"	|   "382"|
-- |"UNDER PAID"|	"581"|
-- |"EXECUTIVE"	|    "37"|


-- transpose above query output in below format

-- |"PAID WELL"	|"UNDER PAID"|"EXECUTIVE"|
-- | 382        | 581        | 37        |

SELECT SUM(CASE WHEN salary < 100000 THEN 1 ELSE 0 END) "UNDER PAID",
	   SUM(CASE WHEN salary > 100000  AND salary < 160000 THEN 1 ELSE 0 END) "PAID WELL",
	   SUM(CASE WHEN salary > 160000 THEN 1 ELSE 0 END) "EXECUTIVE"
FROM employees;




