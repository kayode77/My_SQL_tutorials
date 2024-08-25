-- View Creation
-- Total rows: 1000 of 37674 of data district
SELECT *
FROM home_school_district

-- Total rows: 1000 of 37167 left after removing the Null values
SELECT *
FROM home_school_district
WHERE homeschool_students IS NOT Null
AND lea_name IS NOT Null
AND lea_id IS NOT Null

-- Total rows: 507 of 507 of Null values
SELECT *
FROM home_school_district
WHERE homeschool_students IS Null
OR lea_name IS Null
OR lea_id IS Null

CREATE VIEW v_new_home_school_district as
SELECT *
FROM (SELECT *
FROM home_school_district
WHERE homeschool_students IS NOT Null
AND lea_name IS NOT Null
AND lea_id IS NOT Null) a

-- Total rows: 198 of 198 of data state
SELECT *
FROM home_school_state

-- Total rows: 192 of 192 left after removing the Null values 
SELECT *
FROM home_school_state
WHERE homeschool_students IS NOT Null

-- Total rows: 6 of 6 of Null values
SELECT *
FROM home_school_state
WHERE homeschool_students IS Null


CREATE VIEW v_new_home_school_state as
SELECT *
FROM (SELECT *
FROM home_school_state
WHERE homeschool_students IS NOT Null) a


WITH new_home_school_district AS
(SELECT *
FROM home_school_district
WHERE homeschool_students IS NOT Null
AND lea_name IS NOT Null
AND lea_id IS NOT Null)
SELECT state,homeschool_students
FROM new_home_school_district
            