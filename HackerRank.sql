SELECT DISTINCT bp.n, CASE 
    WHEN bp.p IS NULL THEN 'Root'
    WHEN bp2.n IS NULL THEN 'Leaf'
    ELSE 'Inner' END
FROM BST bp 
LEFT JOIN BST bp2 ON bp.n = bp2.p 
ORDER By bp.n;

SELECT N, 
IF(P IS NULL,'Root',
   IF((SELECT COUNT(*) FROM BST WHERE P=B.N)>0,
      'Inner','Leaf')) 
FROM BST AS B ORDER BY N;

SELECT cp.company_code, cp.founder, COUNT(distinct lm.lead_manager_code), COUNT(distinct sm.senior_manager_code), COUNT(distinct mn.manager_code), COUNT(distinct em.employee_code)
FROM Company cp 
INNER JOIN Lead_Manager lm ON cp.company_code = lm.company_code
INNER JOIN Senior_Manager sm ON sm.lead_manager_code = lm.lead_manager_code
INNER JOIN Manager mn ON mn.senior_manager_code = sm.senior_manager_code
INNER JOIN Employee em ON em.manager_code = mn.manager_code
Group By cp.company_code, cp.founder
Order By cp.company_code;

SELECT COUNT(*)
FROM CITY
WHERE POPULATION > 100000

SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

SELECT FLOOR(AVG(POPULATION))
FROM CITY;

SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';

SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;

SELECT CEIL(AVG(e.SALARY) - AVG(REPLACE(e.SALARY, '0','')))
FROM EMPLOYEES e;

SELECT e.salary * e.months AS TotalSalary, COUNT(e.name) 
FROM Employee e
GROUP BY TotalSalary
ORDER BY TotalSalary DESC
LIMIT 1;

SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2)
FROM STATION;

SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N BETWEEN 38.7880 AND 137.2345;

SELECT ROUND(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345

SELECT ROUND(LONG_W, 4)
FROM STATION s
WHERE s.lat_N IN
(SELECT MAX(LAT_N)
FROM STATION
WHERE LAT_N < 137.2345
)

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

SELECT ROUND(LAT_N, 4)
FROM STATION s
WHERE LAT_N > 38.770
ORDER BY LAT_N
LIMIT 1;

SELECT ROUND(LONG_W, 4)
FROM STATION s
WHERE LAT_N > 38.770
ORDER BY LAT_N
LIMIT 1;

SELECT ROUND(ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)),4) 
FROM STATION

SELECT ROUND(SQRT(POW(MAX(LAT_N) - MIN(LAT_N), 2) + POW(MAX(LONG_W) - MIN(LONG_W), 2)),4) 
FROM STATION

SELECT round(S.LAT_N,4) median 
FROM station S where 
(SELECT count(Lat_N) from station where Lat_N < S.LAT_N) = (SELECT count(Lat_N) from station where Lat_N > S.LAT_N)

--BASIC JOIN 
-- --------Asian Population
SELECT SUM(ci.POPULATION)
FROM CITY ci
INNER JOIN COUNTRY co ON ci.CountryCode = co.code  
WHERE co.CONTINENT = 'Asia';
-- --------African Cities
SELECT ci.name 
FROM CITY ci
INNER JOIN COUNTRY co on co.CODE = ci.COUNTRYCODE
WHERE co.CONTINENT = 'Africa'
-- --------Average Population of Each Continent 
SELECT co.CONTINENT, FLOOR(AVG(ci.population)) 
FROM CITY ci
INNER JOIN COUNTRY co on co.CODE = ci.COUNTRYCODE
GROUP BY co.CONTINENT
-- ---------The Report 
SELECT IF(g.GRADE < 8, NULL, s.NAME), g.GRADE, s.MARKS
FROM STUDENTS s
INNER JOIN GRADES g ON s.marks BETWEEN g.MIN_MARK AND g.MAX_MARK
ORDER BY g.grade DESC, s.name, s.marks;
-- ----------Top Competitor
SELECT ha.hacker_id, ha.name 
FROM Hackers ha
INNER JOIN Submissions sub ON ha.hacker_id =  sub.hacker_id
INNER JOIN Challenges cha ON cha.challenge_id = sub.challenge_id
INNER JOIN Difficulty dif ON dif.difficulty_level = cha.difficulty_level
WHERE sub.score = dif.score
GROUP BY ha.hacker_id, ha.name
HAVING COUNT(sub.hacker_id) > 1
ORDER BY COUNT(sub.hacker_id) DESC, sub.hacker_id ASC;
-- -----------------Olivander's Inventory
/*
Hermione decides the best way to choose is by determining the 
minimum number of gold galleons needed to buy each non-evil wand 
of high power and age. */
SELECT MIN(w.id) ,p.age, MIN(w.coins_needed), w.power
FROM Wands w
INNER JOIN Wands_Property p ON p.code = w.code
WHERE p.is_evil = 0 and w.coins_needed = (
    SELECT min(coins_needed) 
    FROM Wands as w1 
    INNER JOIN Wands_Property as p2 ON w1.code = p2.code
    WHERE w1.power = w.power and p2.age = p.age)
GROUP BY p.age, w.power
ORDER BY power DESC, age DESC;


select w.id,wp.age,w.coins_needed,w.power 
from wands as w, 
wands_property as wp 
where w.code=wp.code and wp.is_evil=0 and w.coins_needed =(
    select min(wo.coins_needed) 
    from wands as wo 
    where wo.power=w.power and wo.code=w.code) 
order by power desc, age desc
-- -----------------challenges 
/*
Enter your query here.
*/
Select c.hacker_id, h.name, count(c.hacker_id) as challenges_count
FROM Hackers h 
INNER JOIN Challenges c ON c.hacker_id = h.hacker_id 
GROUP BY c.hacker_id, h.name
/* check for top number */
HAVING  
        challenges_count = (
            SELECT MAX(tmp.ct)
            FROM (SELECT COUNT(*) as ct
                   FROM Challenges c2
                   GROUP BY c2.hacker_id) tmp
            )
         /* check not in list of those with only 1 */
        or challenges_count in ( 
                SELECT tmp2.ct
                FROM
                    (SELECT COUNT(*) as ct
                      FROM Challenges c3
                      GROUP BY c3.hacker_id) tmp2
                GROUP BY tmp2.ct
                HAVING COUNT(*) = 1)                
ORDER BY challenges_count DESC, c.hacker_id;

-- ----------------------Contest LeaderBoard 
SELECT maxes.hack_id, h.name, SUM(maxes.score) as TotalScore
FROM (Select MAX(score) as score, hacker_id as hack_id
      FROM Submissions
      Group By hacker_id, challenge_id) maxes
      INNER JOIN Hackers h ON h.hacker_id = maxes.hack_id
WHERE maxes.score > 0
GROUP BY maxes.hack_id, h.name
ORDER BY TotalScore DESC, maxes.hack_id;
