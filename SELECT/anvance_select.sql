

# check type of triangle it is 
-- https://www.hackerrank.com/challenges/what-type-of-triangle/problem
SELECT 
    CASE
        WHEN A + B <= C OR B + C <= A OR C + A <= B THEN 'Not A Triangle'
        WHEN A = B AND B = C AND C = A THEN 'Equilateral'
        WHEN A = B OR A = C OR B = C THEN 'Isosceles'
        ELSE 'Scalene'
    END
FROM  TRIANGLES;



(SELECT CONCAT(NAME, 
			   '(' ,
			   SUBSTRING(OCCUPATION, 1, 1),
			   ')' ) as new_name  
FROM OCCUPATIONS 
ORDER BY new_name );

(SELECT 
	CONCAT('There are a total of ',
			COUNT(OCCUPATION), " ",
			LOWER(OCCUPATION),
			's.')
FROM OCCUPATIONS 
GROUP BY OCCUPATION 
ORDER BY COUNT(OCCUPATION) ASC, 
			OCCUPATION ASC );