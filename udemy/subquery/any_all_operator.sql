-- ANY
-- ANY will return True if any of the value returned by sub-query matches the condition
-- This query will return all the records where employees  belongs to any region of
-- United States
SELECT first_name, region_id
FROM employees
WHERE region_id = ANY (SELECT region_id FROM regions WHERE country = 'United States')
ORDER BY region_id



-- ALL
-- ANY will return True if all of the values returned by sub-query  matches the condition
-- This query will return all the records where employees do not belongs to all region of
-- United States
SELECT first_name, region_id
FROM employees
WHERE region_id > ALL (SELECT region_id FROM regions WHERE country = 'United States')
ORDER BY region_id


-- get all employees that work in Kids devision and there hire_date is greater then all the
-- hire_dates of all employee in Maintenance department
SELECT first_name, 
       department
FROM employees
WHERE (
            department = ANY ( 
                                Select 
                                    department 
                                FROM departments 
                                WHERE division = 'Kids')
        )
        AND (
            hire_date > ALL (
                                SELECT hire_date 
                                FROM employees 
                                WHERE department ='Maintenance'
                            )
        )


-- Get the most frequent salary value and if there are multiple get the max
SELECT a.salary 
FROM (SELECT salary , 
             count(salary) salary_count
      FROM employees
      GROUP BY salary
      ORDER BY salary_count DESC, salary DESC limit 1
      ) a


SELECT salary
from employees
group by salary
having count(salary) >= ALL (select count(*) from employees
                             group by salary)
order by salary desc
limit 1