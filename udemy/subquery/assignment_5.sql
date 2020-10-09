Create table dupes (id integer, name varchar(10));


insert into dupes values (1, 'Frank');
insert into dupes values (2, 'Frank');
insert into dupes values (3, 'Robert');
insert into dupes values (4, 'Robert');
insert into dupes values (5, 'Sam');
insert into dupes values (6, 'Frank');
insert into dupes values (7, 'Peter');



-- get all unique name with there id
SELECT * 
FROM dupes 
WHERE name = ANY (SELECT DISTINCT(name) FROM dupes);



-- get average salary by not considering the min and max salary
SELECT Round(AVG(salary)) 
FROM employees 
WHERE salary NOT IN (
		(SELECT MIN(salary) FROM employees) ,
		(SELECT MAX(salary) FROM employees))



CREATE TABLE student
	(student_no integer, 
	 student_name varchar(20),
	 age integer
	);

CREATE TABLE student_enrollment
	(student_no integer, 
	 course_no varchar(5)
	);

CREATE TABLE courses
	(course_no varchar(5), 
	 course_title varchar(20),
	 credit integer
	);


INSERT INTO student VALUES(1, 'Michael', 19);
INSERT INTO student VALUES(2, 'Doug', 18);
INSERT INTO student VALUES(3, 'Samantha', 21);
INSERT INTO student VALUES(4, 'Pete', 20);
INSERT INTO student VALUES(5, 'Ralph', 19);
INSERT INTO student VALUES(6, 'Arnold', 22);
INSERT INTO student VALUES(7, 'Michael', 19);
INSERT INTO student VALUES(8, 'Jack', 19);
INSERT INTO student VALUES(9, 'Rand', 17);
INSERT INTO student VALUES(10, 'Sylvia', 20);


INSERT INTO student_enrollment VALUES(1, 'CS110');
INSERT INTO student_enrollment VALUES(1, 'CS180');
INSERT INTO student_enrollment VALUES(1, 'CS210');
INSERT INTO student_enrollment VALUES(2, 'CS107');
INSERT INTO student_enrollment VALUES(2, 'CS220');
INSERT INTO student_enrollment VALUES(3, 'CS110');
INSERT INTO student_enrollment VALUES(3, 'CS180');
INSERT INTO student_enrollment VALUES(4, 'CS220');
INSERT INTO student_enrollment VALUES(5, 'CS110');
INSERT INTO student_enrollment VALUES(5, 'CS180');
INSERT INTO student_enrollment VALUES(5, 'CS210');
INSERT INTO student_enrollment VALUES(5, 'CS220');
INSERT INTO student_enrollment VALUES(6, 'CS110');
INSERT INTO student_enrollment VALUES(7, 'CS110');
INSERT INTO student_enrollment VALUES(7, 'CS210');


INSERT INTO courses VALUES('CS110', 'Pre Calculus', 4);
INSERT INTO courses VALUES('CS180', 'Physics', 4);
INSERT INTO courses VALUES('CS107', 'Intro To Physics', 3);
INSERT INTO courses VALUES('CS210', 'Art History', 3);
INSERT INTO courses VALUES('CS220', 'US History', 3);



-- Get name of those student who are taking the courses Physics and US History.

SELECT student_name 
FROM student
WHERE student_no IN (
	SELECT distinct(student_no)
	FROM student_enrollment 
	WHERE course_no IN (
		SELECT course_no 
		FROM courses 
		WHERE course_title IN ('Physics', 'US History')
	)
)


-- name of the student that is taking the highest number of courses.

SELECT student_name FROM student
WHERE student_no = (
	SELECT student_no
	FROM student_enrollment
	GROUP BY student_no
	ORDER BY COUNT(student_no) DESC
	LIMIT 1
);


-- find the student that is the oldest without LIMIT and ORDER BY

SELECT student_name
FROM student
WHERE age > ALL (SELECT age FROM student)







