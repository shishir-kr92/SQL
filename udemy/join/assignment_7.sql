-- generate a report containing first_name, department, hire_date, country
-- of the employee who was hired first


-- APPROACH 1
select first_name, temp.department, hire_date, r.region
from (
	select *,
		(select min(hire_date) from employees )first_hire_date, 
		(select max(hire_date) from employees )last_hire_date 
	from employees
) temp
inner join  regions r
on r.region_id = temp.region_id
where temp.hire_date = temp.first_hire_date or temp.hire_date = temp.last_hire_date


-- APPROACH 2
select e.first_name, e.department, e.hire_date, r.region
from employees e
inner join  regions r
on e.region_id = r.region_id
where e.hire_date = (select min(hire_date) from employees)
	or e.hire_date = (select max(hire_date) from employees)
order by hire_date


-- APPROACH 3
select e.first_name, e.department, e.hire_date, r.region
from employees e
inner join  regions r
on e.region_id = r.region_id
where e.hire_date = (select min(hire_date) from employees)
UNION ALL
select e.first_name, e.department, e.hire_date, r.region
from employees e
inner join  regions r
on e.region_id = r.region_id
where e.hire_date = (select max(hire_date) from employees)

-- generate a report how the salary budget fluctuated in every 90 days period

SELECT (e1.hire_date - 90) start_date, 
		e1.hire_date end_date,
		salary,
	   (select sum(salary) from employees e2  where e2.hire_date BETWEEN e1.hire_date - 90 AND e1.hire_date) spending_pattern
from employees e1
order by hire_date










