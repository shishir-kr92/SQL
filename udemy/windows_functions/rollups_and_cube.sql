CREATE TABLE sales
(
	continent varchar(20),
	country varchar(20),
	city varchar(20),
	units_sold integer
);

INSERT INTO sales VALUES ('North America', 'Canada', 'Toronto', 10000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Montreal', 5000);
INSERT INTO sales VALUES ('North America', 'Canada', 'Vancouver', 15000);
INSERT INTO sales VALUES ('Asia', 'China', 'Hong Kong', 7000);
INSERT INTO sales VALUES ('Asia', 'China', 'Shanghai', 3000);
INSERT INTO sales VALUES ('Asia', 'Japan', 'Tokyo', 5000);
INSERT INTO sales VALUES ('Europe', 'UK', 'London', 6000);
INSERT INTO sales VALUES ('Europe', 'UK', 'Manchester', 12000);
INSERT INTO sales VALUES ('Europe', 'France', 'Paris', 5000);



------------------------------------------------------------------------------------------------------------------------

-- this query will generate report that will contain group by operation
-- first on continent, then by country, then by city
-- empty bracket(if specified) will perform aggregation operation without any grouping
SELECT continent, country, city, SUM(sales.units_sold) 
FROM sales 
GROUP BY GROUPING SETS(continent, country, city, ())


-- ROLLUP
-- will produce similar result, will preform aggregation operation
-- based on column specified
SELECT continent, country, city, SUM(sales.units_sold) 
FROM sales 
GROUP BY ROLLUP(continent, country, city)


-- CUBE
-- will perform aggregation operation on  all possible combination
-- of column specified
SELECT continent, country, city, SUM(sales.units_sold) 
FROM sales 
GROUP BY CUBE(continent, country, city)


-- NOTES : ROLLUP and CUBE are performance tools. 
-- You should use ROLLUP if you want your data hierarchically and
-- CUBE if you want all possible combinations.


