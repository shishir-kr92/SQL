-- Output data in below format
-- |sports_employee  |tools_employees  |clothing_employees| 
-- |34				 | 39			   | 47				  |

SELECT SUM(CASE WHEN department = 'Sports' THEN 1 ELSE 0 END) Sports,
	   SUM(CASE WHEN department = 'Tools' THEN 1 ELSE 0 END) Tools,
	   SUM(CASE WHEN department = 'Clothing' THEN 1 ELSE 0 END) Clothing,
	   SUM(CASE WHEN department = 'Computers' THEN 1 ELSE 0 END) Computer
FROM employees;




------------------------------------------------------------------------------------------------------------
select first_name,
	  (case when region_id = 1 then (select region from regions where region_id = 1) end) region_1,
	  (case when region_id = 2 then (select region from regions where region_id = 2) end) region_2,
	  (case when region_id = 3 then (select region from regions where region_id = 3) end) region_3,
	  (case when region_id = 4 then (select region from regions where region_id = 4) end) region_4,
	  (case when region_id = 5 then (select region from regions where region_id = 5) end) region_5,
	  (case when region_id = 6 then (select region from regions where region_id = 6) end) region_6,
	  (case when region_id = 7 then (select region from regions where region_id = 7) end) region_7
from employees e
order by first_name
------------------------------------------------------------------------------------------------------------

--  ______________________________
-- |united_states|	asia|	canada|
-- |		  438|	 264|	   298|
-- --------------------------------

SELECT (Count(a.region_1)  + COUNT(a.region_2) + COUNT(a.region_3) ) "united_state",
	   (Count(a.region_4)  + COUNT(a.region_5) ) "asia",
	   (Count(a.region_6)  + COUNT(a.region_7)  ) "canada"
FROM (
SELECT first_name,
	  (CASE WHEN region_id = 1 THEN (SELECT region FROM regions WHERE region_id = 1) END) region_1,
	  (CASE WHEN region_id = 2 THEN (SELECT region FROM regions WHERE region_id = 2) END) region_2,
	  (CASE WHEN region_id = 3 THEN (SELECT region FROM regions WHERE region_id = 3) END) region_3,
	  (CASE WHEN region_id = 4 THEN (SELECT region FROM regions WHERE region_id = 4) END) region_4,
	  (CASE WHEN region_id = 5 THEN (SELECT region FROM regions WHERE region_id = 5) END) region_5,
	  (CASE WHEN region_id = 6 THEN (SELECT region FROM regions WHERE region_id = 6) END) region_6,
	  (CASE WHEN region_id = 7 THEN (SELECT region FROM regions WHERE region_id = 7) END) region_7
FROM employees e ) a