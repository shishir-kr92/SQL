CREATE TABLE professors (
    last_name varchar(20), 
	department varchar(12),
	salary integer,
	hire_date date );


INSERT INTO professors VALUES('Chongs', 'Science', 88000, '2006-04-18');

INSERT INTO professors VALUES('Brown', 'Math', 97000, '2002-08-22');
INSERT INTO professors VALUES('Jones', 'History', 67000, '2009-11-17');
INSERT INTO professors VALUES('Wilson', 'Astronomy', 110000, '2005-01-15');
INSERT INTO professors VALUES('Miller', 'Agriculture', 82000, '2008-05-08');
INSERT INTO professors VALUES('Williams', 'Law', 105000, '2001-06-05');


-- Output following result  "Chong works in the Science department"

SELECT last_name || ' works in the ' || department || ' department' 
FROM professors ;



-- Write a SQL query against the professors table that would return the following result:
-- A professor is highly paid if they make greater than 95000.

-- "It is false that professor Chong is highly paid
-- "It is true that professor Brown is highly paid"
-- "It is false that professor Jones is highly paid"
-- "It is true that professor Wilson is highly paid"
-- "It is false that professor Miller is highly paid"
-- "It is true that professor Williams is highly paid"


SELECT 'It is '   ||
       (CASE WHEN salary >= 95000 THEN true ELSE false END)  ||
       ' that professor ' ||
       last_name ||
       ' is highly paid'
FROM professors ;

SELECT 'It is '   ||
       (salary > 95000)  ||
       ' that professor ' ||
       last_name ||
       ' is highly paid'
FROM professors ;


-- Write a query that returns all of the records and columns from the professors table
-- but shortens the department names to only the first three characters in upper case.

SELECT last_name, 
       UPPER(SUBSTRING(department, 0, 4)) department,
       salary, 
       hire_date
FROM professors


-- Write a query that returns the highest and lowest salary from the professors table
-- excluding the professor named 'Wilson'.

SELECT MIN(salary), 
       MAX(salary) 
FROM professors 
WHERE last_name != 'Wilson';


-- Write a query that will display the hire date of the professor that has been teaching
-- the longest.
SELECT MIN(hire_date), 
       MAX(hire_date)
FROM professors;
