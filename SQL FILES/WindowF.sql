-- Window function and WITH 
SELECT names, avg_grade
FROM (
SELECT names,(e.maths_scores + e.english_scores + e.chemistry_scores + e.physics_scores + e.biology_scores)/5 as avg_grade,
RANK() OVER(ORDER BY names)
FROM waec_results e) a
ORDER BY avg_grade desc

SELECT names, avg_grade,
RANK() OVER(ORDER BY avg_grade desc)
FROM (
SELECT names,(e.maths_scores + e.english_scores + e.chemistry_scores + e.physics_scores + e.biology_scores)/5 as avg_grade,
RANK() OVER(ORDER BY names)
FROM waec_results e) a

SELECT names,(e.maths_scores + e.english_scores + e.chemistry_scores + e.physics_scores + e.biology_scores)/5 as avg_grade,
RANK() OVER(ORDER BY names)
FROM waec_results e

SELECT *
FROM v_new_home_school_state

SELECT state, COUNT(*)
FROM v_new_home_school_state
GROUP BY state
ORDER BY COUNT(*) asc

SELECT state, COUNT(*)
FROM v_new_home_school_district
GROUP BY state
ORDER BY COUNT(*) asc

