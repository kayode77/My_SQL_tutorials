-- Where clause examples 
SELECT *
FROM home_school_state
WHERE not homeschool_students IS Null

SELECT *
FROM home_school_state
WHERE homeschool_students IS Null

SELECT *
FROM home_school_district
WHERE homeschool_students IS Null

SELECT *
FROM home_school_district
WHERE not homeschool_students IS Null

SELECT *
FROM home_school_state
WHERE state  = 'CALIFORNIA'

SELECT *
FROM home_school_state
WHERE state  = 'CALIFORNIA'
OR state  = 'COLORADO'
OR state  = 'DELAWARE'

SELECT *
FROM home_school_state
WHERE state IN ('CALIFORNIA','COLORADO','DELAWARE')

SELECT *
FROM home_school_state
WHERE state ='CALIFORNIA' OR state='COLORADO'

SELECT *
FROM home_school_state
WHERE state ='CALIFORNIA' 
AND homeschool_students > 5000 

SELECT *
FROM home_school_state
WHERE state ='CALIFORNIA' 
OR homeschool_students > 5000 

SELECT *
FROM home_school_state
WHERE homeschool_students > 5000
OR (state ='CALIFORNIA' AND state ='COLORADO')

SELECT *
FROM home_school_state
WHERE homeschool_students > 5000
AND (state ='CALIFORNIA' OR state ='COLORADO')

SELECT state,SUBSTRING(year FROM 1 FOR 4)as "Year"
FROM home_school_state

SELECT state, MIN(homeschool_students)
FROM home_school_state
GROUP BY state

SELECT MAX(homeschool_students)
FROM (SELECT *
FROM home_school_state
WHERE not homeschool_students IS Null) AS FOO


SELECT MIN(homeschool_students)
FROM (SELECT *
FROM home_school_state
WHERE not homeschool_students IS Null) AS FOO

SELECT ROUND(AVG(homeschool_students))
FROM (SELECT *
FROM home_school_state
WHERE not homeschool_students IS Null) AS FOO

SELECT COUNT(homeschool_students)
FROM home_school_state

SELECT SUM(homeschool_students)
FROM (SELECT *
FROM home_school_state
WHERE not homeschool_students IS Null) AS FOO
-- SUM WITHOUT THE NAN
SELECT SUM(homeschool_students)
FROM (SELECT *
FROM home_school_state
WHERE not homeschool_students IS Null) AS FOO
WHERE state = 'CALIFORNIA'

-- OR

SELECT SUM(homeschool_students)
FROM home_school_state
WHERE state = 'CALIFORNIA'

SELECT state, SUM(homeschool_students) as Homeschool_Summation
FROM home_school_state
GROUP BY state
ORDER BY Homeschool_Summation asc

SELECT state, SUM(homeschool_students) Homeschool_Summation
FROM (SELECT *
FROM home_school_state
WHERE not homeschool_students IS Null) AS FOO
GROUP BY state
ORDER BY Homeschool_Summation desc

SELECT state, COUNT(*) total_states
FROM (SELECT *
FROM home_school_state
WHERE not homeschool_students IS Null) AS FOO
GROUP BY state
ORDER BY total_states asc

SELECT d.state, COUNT(*) total_states
FROM (SELECT *
FROM home_school_state
WHERE not homeschool_students IS Null) d
GROUP BY state
-- HAVING COUNT(*) < 6
ORDER BY state
