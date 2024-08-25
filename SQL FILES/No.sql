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
FROM v_new_home_school_state
WHERE state  = 'CALIFORNIA'

SELECT *
FROM v_new_home_school_state
WHERE state  = 'CALIFORNIA'
OR state  = 'COLORADO'
OR state  = 'DELAWARE'

SELECT *
FROM v_new_home_school_state
WHERE state IN ('CALIFORNIA','COLORADO','DELAWARE')

SELECT *
FROM v_new_home_school_state
WHERE state ='CALIFORNIA' OR state='COLORADO'

SELECT *
FROM v_new_home_school_state
WHERE state ='CALIFORNIA' 
AND homeschool_students > 5000 

SELECT *
FROM v_new_home_school_state
WHERE state ='CALIFORNIA' 
OR homeschool_students > 5000 

SELECT *
FROM v_new_home_school_state
WHERE homeschool_students > 5000
OR (state ='CALIFORNIA' AND state ='COLORADO')


SELECT *
FROM v_new_home_school_state
WHERE homeschool_students > 5000
AND (state ='CALIFORNIA' OR state ='COLORADO')

select *
from company
where salary is null

select *
from company
where salary is null
or join_date is null

select *
from company
where salary is not null
and join_date is not null

select *
from company
where age between 23 and 25

select name, (salary is null) as "Null salary" , (join_date is null) as "Null date"
from company
order by salary desc

select name, replace(name, 'Allen','Peter') as "NAME"
from company

select *
from company

SELECT state, MIN(homeschool_students)
FROM v_new_home_school_state
GROUP BY state

SELECT MAX(homeschool_students)
FROM (SELECT *
FROM v_new_home_school_state) AS FOO


SELECT MIN(homeschool_students)
FROM (SELECT *
FROM v_new_home_school_state) AS FOO

SELECT ROUND(AVG(homeschool_students))
FROM (SELECT *
FROM v_new_home_school_state) AS FOO

SELECT COUNT(homeschool_students)
FROM v_new_home_school_state

SELECT SUM(homeschool_students)
FROM (SELECT *
FROM v_new_home_school_state) AS FOO

-- SUM WITHOUT THE NAN
SELECT SUM(homeschool_students)
FROM (SELECT *
FROM v_new_home_school_state) AS FOO
WHERE state = 'CALIFORNIA'

-- OR

SELECT SUM(homeschool_students)
FROM v_new_home_school_state
WHERE state = 'CALIFORNIA'

SELECT state, SUM(homeschool_students) as Homeschool_Summation
FROM v_new_home_school_state
GROUP BY state
ORDER BY Homeschool_Summation asc

SELECT state, SUM(homeschool_students) Homeschool_Summation
FROM (SELECT *
FROM v_new_home_school_state) AS FOO
GROUP BY state
ORDER BY Homeschool_Summation desc

SELECT state, COUNT(*) total_states
FROM (SELECT *
FROM v_new_home_school_state) AS FOO
GROUP BY state
ORDER BY total_states asc

SELECT d.state, COUNT(*) total_states
FROM (SELECT *
FROM v_new_home_school_state) d
GROUP BY state
-- HAVING COUNT(*) < 6
ORDER BY state

SELECT d.state, COUNT(*) total_states
FROM (SELECT *
FROM v_new_home_school_state) d
GROUP BY state
HAVING COUNT(*) < 6
ORDER BY state


SELECT d.state, COUNT(*) total_states
FROM (SELECT *
FROM v_new_home_school_state) d
GROUP BY state
ORDER BY state

