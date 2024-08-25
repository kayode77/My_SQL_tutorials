SELECT * FROM v_new_home_school_district

SELECT *
FROM v_new_home_school_state

SELECT lea_name,COUNT(*)
FROM v_new_home_school_district
GROUP BY lea_name
ORDER BY COUNT(*) desc

(SELECT lea_name,COUNT(*)
FROM v_new_home_school_district
GROUP BY lea_name
ORDER BY COUNT(*) desc)
UNION ALL
SELECT 'TOTAL', COUNT(*)
FROM v_new_home_school_district

SELECT *
FROM(SELECT state, lea_name, COUNT(*) OVER(PARTITION BY lea_name) lea_name_count
FROM v_new_home_school_district) a
GROUP BY state, lea_name, lea_name_count

SELECT state, SUM(state_count) state_sum 
FROM(SELECT state, COUNT(*) OVER(PARTITION BY state) state_count
FROM v_new_home_school_state) a
GROUP BY state
ORDER BY state_sum 

(SELECT state, SUM(state_count) state_sum 
FROM(SELECT state, COUNT(*) OVER(PARTITION BY state) state_count
FROM v_new_home_school_state) a
GROUP BY state
ORDER BY state_sum)
UNION ALL
SELECT 'TOTAL', COUNT(*)
FROM(SELECT state, COUNT(*) OVER(PARTITION BY state) state_count
FROM v_new_home_school_state) a

SELECT *
FROM v_new_home_school_state

SELECT lea_name, state, SUM(homeschool_students) homeschool_students_sum
FROM v_new_home_school_district
GROUP BY lea_name, lea_id, state
ORDER BY lea_name

SELECT lea_name, state, homeschool_students,
RANK() OVER(PARTITION BY state ORDER BY homeschool_students desc)
FROM v_new_home_school_district

SELECT state, homeschool_students,
RANK() OVER(PARTITION BY state ORDER BY homeschool_students desc)
FROM v_new_home_school_state

SELECT state, SUM(homeschool_students) sum_homeschool_students
FROM(
SELECT state, homeschool_students,
RANK() OVER(PARTITION BY state ORDER BY homeschool_students desc)
FROM v_new_home_school_state)a
GROUP BY state
ORDER BY sum_homeschool_students desc

SELECT * 
FROM(SELECT state, homeschool_students,
RANK() OVER(PARTITION BY state ORDER BY homeschool_students desc)
FROM v_new_home_school_state) a
WHERE RANK = 6

SELECT state, SUM(homeschool_students) homeschool_students_sum, a.RANK
FROM(SELECT state, homeschool_students,
RANK() OVER(PARTITION BY state ORDER BY homeschool_students desc)
FROM v_new_home_school_state) a
GROUP BY state,a.RANK 
ORDER BY homeschool_students_sum

SELECT state, homeschool_students, a.RANK
FROM(SELECT state, homeschool_students,
RANK() OVER(PARTITION BY state ORDER BY homeschool_students desc)
FROM v_new_home_school_state) a
ORDER BY homeschool_students desc

SELECT state, homeschool_students, a.RANK
FROM(SELECT state, homeschool_students,
RANK() OVER(PARTITION BY state ORDER BY homeschool_students desc) RANK
FROM v_new_home_school_state) a
WHERE RANK= 2

SELECT state, year,homeschool_students,
FIRST_VALUE(homeschool_students) OVER(PARTITION BY state ORDER BY homeschool_students desc)
FROM v_new_home_school_state



SELECT *
FROM v_new_home_school_district

SELECT CAST (lea_id AS INTEGER) AS lea_id_int 
FROM v_new_home_school_district

ALTER TABLE cars
ALTER COLUMN year TYPE VARCHAR(4);

-- The UPDATE Statement
-- The UPDATE statement is used to modify the value(s) in existing records in a table.
UPDATE cars
SET color = 'white', year = 1970
WHERE brand = 'Toyota';

-- CASE
SELECT state,year, homeschool_students,
CASE
  WHEN  homeschool_students < 10000 THEN 'Low attendance'
  WHEN homeschool_students  <= 100000 THEN 'High attendance'
ELSE
  'Highest attendance'
END as rate_of_attendance
FROM v_new_home_school_state;

-- EXISTS
-- The EXISTS operator is used to test for the existence of any record in a sub query.
--The EXISTS operator returns TRUE if the sub query returns one or more records.

SELECT v_new_home_school_district.year
FROM v_new_home_school_district
WHERE 
EXISTS 
(SELECT state
FROM v_new_home_school_state
WHERE homeschool_students = v_new_home_school_district.homeschool_students)
GROUP BY year;

SELECT lea_name,lea_id, COUNT(*) number_of_lea_name
FROM v_new_home_school_district
GROUP BY lea_name,lea_id
ORDER BY lea_name asc;

SELECT lea_name, SUM(homeschool_students) homeschool_sum 
FROM v_new_home_school_district
GROUP BY lea_name
ORDER BY lea_name asc;

SELECT * 
FROM v_new_home_school_district

SELECT *
FROM v_new_home_school_state
ORDER BY homeschool_students desc

-- SELECT ARRAY_AGG(SALARY) FROM COMPANY;
SELECT ARRAY_AGG(state) as states
FROM(
SELECT state
FROM v_new_home_school_state
GROUP BY state) a




