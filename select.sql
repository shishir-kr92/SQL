## MYSQL


## like command is used to match pattern

# select city name ending with vowel
SELECT DISTINCT CITY FROM STATION  WHERE CITY LIKE '%a' or
 										 CITY LIKE '%e' or 
 										 CITY LIKE '%i' or 
 										 CITY LIKE '%o' or 
 										 CITY LIKE '%u' ;

SELECT CITY FROM STATION WHERE CITY RLIKE '.*[aeiou]^';

# select city where name starting and ending with vowel
SELECT CITY FROM STATION WHERE CITY RLIKE '^[aeiou].*[aeiou]$'



# select city where name does not start with vowel
SELECT DISTINCT CITY FROM STATION WHERE NOT CITY RLIKE '^[aeiou].*'

# select city where name does not ends with vowel
SELECT DISTINCT CITY FROM STATION WHERE NOT CITY RLIKE '.*[aeiou]$';

# select city where name either does not start or end with vowel
SELECT DISTINCT CITY FROM STATION WHERE NOT CITY RLIKE '^[aeiou].*[aeiou]$'

SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY, 1) NOT IN ('a','e','i','o','u')
									 OR RIGHT(CITY, 1) NOT IN  ('a','e','i','o','u')


# select city where name  does not start and end with vowel
SELECT DISTINCT CITY FROM STATION WHERE NOT CITY RLIKE '^[aeiou].*[aeiou]$'

SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY, 1) NOT IN ('a','e','i','o','u')
									 OR RIGHT(CITY, 1) NOT IN  ('a','e','i','o','u') 





# URL -> https://www.hackerrank.com/challenges/more-than-75-marks/problem
SELECT NAME FROM STUDENTS WHERE MARKS > 75 ORDER BY RIGHT(NAME,3), ID ASC











	

