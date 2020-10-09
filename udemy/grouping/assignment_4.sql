-- count of same first name in country
-- filter out the record having count greater then 1
SELECT first_name ,
       COUNT(first_name) as first_name_count
FROM employees
GROUP BY first_name
HAVING COUNT(first_name) > 1
ORDER BY 1;



-- get unique department without DISTINCT clause
SELECT department
FROM employees
GROUP BY department;


-- get the unique domain name and number of employees register 
-- with that domain name
SELECT SUBSTRING(email, POSITION('@' IN email) + 1) domain_name, 
       count(*) as domain_count
FROM employees
WHERE email IS NOT NULL
GROUP BY domain_name
ORDER BY domain_count;

-- get min, max. average salary per gender per region
SELECT gender,
       region_id,
       MIN(salary) min_salary,
       MAX(salary) max_salary,
       ROUND(AVG(salary)) avg_salary
FROM employees
GROUP BY gender, region_id
ORDER BY gender, region_id

------------------------------------------------------------------------------------------------------------


CREATE TABLE fruit_imports
(
	id integer,
	name varchar(20),
	season varchar(10),
	state varchar(20),
	supply integer,
	cost_per_unit decimal
);

insert into fruit_imports values(1, 'Apple', 'All Year', 'Kansas', 32900, 0.22);
insert into fruit_imports values(2, 'Avocado', 'All Year', 'Nebraska', 27000, 0.15);
insert into fruit_imports values(3, 'Coconut', 'All Year', 'California', 15200, 0.75);
insert into fruit_imports values(4, 'Orange', 'Winter', 'California', 17000, 0.22);
insert into fruit_imports values(5, 'Pear', 'Winter', 'Iowa', 37250, 0.17);
insert into fruit_imports values(6, 'Lime', 'Spring', 'Indiana', 40400, 0.15);
insert into fruit_imports values(7, 'Mango', 'Spring', 'Texas', 13650, 0.60);
insert into fruit_imports values(8, 'Orange', 'Spring', 'Iowa', 18000, 0.26);
insert into fruit_imports values(9, 'Apricot', 'Spring', 'Indiana', 55000, 0.20);
insert into fruit_imports values(10, 'Cherry', 'Summer', 'Texas', 62150, 0.02);
insert into fruit_imports values(11, 'Cantaloupe', 'Summer', 'Texas', 8000, 0.49);
insert into fruit_imports values(12, 'Apricot', 'Summer', 'Kansas', 14500, 0.20);
insert into fruit_imports values(13, 'Mango', 'Summer', 'Texas', 17000, 0.68);
insert into fruit_imports values(14, 'Pear', 'Fall', 'Nebraska', 30500, 0.12);
insert into fruit_imports values(15, 'Grape', 'Fall', 'Illinois', 72500, 0.35);


-- displays only the state with the largest amount of fruit supply.
select f.state, sum(f.supply)
from fruit_imports f
group by state
order by 2 desc
limit 1

-- Write a query that returns the most expensive cost_per_unit of every season.
-- The query should display 2 columns, the season and the cost_per_unit

SELECT f.season, MAX(f.cost_per_unit)
FROM fruit_imports f
GROUP BY f.season;


-- Write a query that returns the state that has more than 1 import of the same fruit.
SELECT f.name, f.state, count(*)
FROM fruit_imports f
GROUP BY f.name, f.state
HAVING COUNT(*) > 1;


-- Write a query that returns the seasons that produce either 3 fruits or 4 fruits.
SELECT f.season, count(f.season)
FROM fruit_imports f
GROUP BY f.season
HAVING COUNT(*) = 3 or COUNT(*) = 4;


-- Write a query that takes into consideration the supply and cost_per_unit columns 
-- for determining the total cost and returns the most expensive state with the total cost.
SELECT f.state, SUM(f.supply * f.cost_per_unit)
FROM fruit_imports f
GROUP BY f.state
ORDER BY 2 DESC;




---------------------------------------------------------------------------------------------------
CREATE table fruits (fruit_name varchar(10));
INSERT INTO fruits VALUES ('Orange');
INSERT INTO fruits VALUES ('Apple');
INSERT INTO fruits VALUES (NULL);
INSERT INTO fruits VALUES (NULL);



