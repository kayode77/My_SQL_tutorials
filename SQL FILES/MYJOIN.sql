-- Joins
SELECT *
FROM v_new_home_school_district

SELECT *
FROM v_new_home_school_state

SELECT state, SUM(homeschool_students) sum_homeschool_students
FROM v_new_home_school_state
GROUP BY state
ORDER BY sum_homeschool_students

SELECT MIN(homeschool_students)
FROM (SELECT *
FROM v_new_home_school_state) a

SELECT ROUND(AVG(homeschool_students))
FROM (SELECT *
FROM v_new_home_school_state) a

SELECT ROUND(AVG(homeschool_students))
FROM (SELECT *
FROM v_new_home_school_district) a

SELECT state, SUM(homeschool_students) sum_homeschool_students
FROM (SELECT *
FROM v_new_home_school_district) a
GROUP BY state
ORDER BY sum_homeschool_students desc

SELECT state, SUM(homeschool_students) sum_homeschool_students
FROM (SELECT *
FROM v_new_home_school_district) a
GROUP BY state
EXCEPT
SELECT state, SUM(homeschool_students) sum_homeschool_students
FROM (SELECT *
FROM v_new_home_school_state) a
GROUP BY state
ORDER BY state

SELECT state, SUM(homeschool_students) sum_homeschool_students
FROM (SELECT *
FROM v_new_home_school_district) a
GROUP BY state
UNION
SELECT state, SUM(homeschool_students) sum_homeschool_students
FROM (SELECT *
FROM v_new_home_school_state) a
GROUP BY state
ORDER BY sum_homeschool_students asc

SELECT state, SUM(homeschool_students) sum_homeschool_students
FROM (SELECT *
FROM v_new_home_school_district) a
GROUP BY state
UNION ALL
SELECT state, SUM(homeschool_students) sum_homeschool_students
FROM (SELECT *
FROM v_new_home_school_state) a
GROUP BY state
ORDER BY sum_homeschool_students asc

SELECT state
FROM v_new_home_school_state
GROUP BY state
EXCEPT
SELECT state
FROM v_new_home_school_district
GROUP BY state
ORDER BY state

SELECT state
FROM v_new_home_school_state
GROUP BY state
UNION
SELECT state
FROM v_new_home_school_district
GROUP BY state
ORDER BY state

SELECT state
FROM v_new_home_school_state
GROUP BY state
UNION ALL
SELECT state
FROM v_new_home_school_district
GROUP BY state
ORDER BY state

SELECT state, COUNT (*)
FROM v_new_home_school_state
GROUP BY state
UNION ALL
SELECT 'TOTAL', COUNT(*)
FROM v_new_home_school_state

SELECT state, COUNT (*)
FROM v_new_home_school_district
GROUP BY state
UNION ALL
SELECT 'TOTAL', COUNT(*)
FROM v_new_home_school_district

