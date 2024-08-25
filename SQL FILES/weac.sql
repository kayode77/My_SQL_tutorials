SELECT *
FROM WAEC_RESULTS

SELECT sex,age
FROM WAEC_RESULTS
GROUP BY sex,age
ORDER BY sex desc,age desc

SELECT  names, SUBSTRING(names,POSITION(' ' IN names)) "last name"
FROM WAEC_RESULTS
GROUP BY names

SELECT names,sex,age
FROM WAEC_RESULTS
GROUP BY sex,age,names
ORDER BY sex desc,age desc

SELECT names,COUNT(age)
FROM WAEC_RESULTS
GROUP BY names

SELECT names,COUNT(*)
FROM WAEC_RESULTS
GROUP BY names
ORDER BY COUNT(*) desc

SELECT names,age
FROM WAEC_RESULTS
GROUP BY names
HAVING age > 18

SELECT names,age
FROM WAEC_RESULTS
GROUP BY names
HAVING age < 19

SELECT names, maths_scores, english_scores
FROM WAEC_RESULTS
WHERE maths_scores > 50 AND english_scores > 50
GROUP BY names
ORDER BY maths_scores,english_scores


SELECT COUNT(age)
FROM WAEC_RESULTS

SELECT names, maths_scores,english_scores
FROM WAEC_RESULTS
WHERE maths_scores > 50
GROUP BY names
ORDER BY maths_scores,english_scores