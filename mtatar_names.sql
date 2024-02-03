


--Exercise Begins Here:

-- Save a script containing the query you used to answer each question and your answer (as a comment).--

--1. How many rows are in the names table?

-- SELECT COUNT(name)
-- FROM names;

-- answer:
-- There are 1957046 rows in names

--2. How many total registered people appear in the dataset?
-- SELECT SUM(num_registered)
-- FROM names;

-- Answer:
-- There are 351653025 registered people in 'names'



--3. Which name had the most appearances in a single year in the dataset?
-- SELECT name, year, MAX(num_registered)
-- FROM names
-- GROUP BY name, year
-- ORDER BY MAX(num_registered) DESC;

-- Answer:
-- Linda in 1947 is the top answer




--4. What range of years are included?
-- SELECT MIN(year), MAX(year)
-- FROM names;

-- Answer
-- Min=1880 and Max=2018

-- ALTERNATE (YOu could scroll through and look and see if anything was missing perchance...)
-- SELECT DISTINCT year
-- FROM names
-- ORDER BY year;




--5. What year has the largest number of registrations?
-- SELECT year, SUM(num_registered)
-- FROM names
-- GROUP BY year
-- ORDER BY SUM(num_registered) DESC;

-- Answer
-- 1957 had 4,200,022




--6. How many different (distinct) names are contained in the dataset?
-- SELECT COUNT(DISTINCT(name))
-- from names;

--Answer
--There are 98400 unique names




--7. Are there more males or more females registered?
-- SELECT gender, COUNT(gender)
-- FROM names
-- GROUP BY gender;

--Answer
--There are more females than males

-- SELECT name, SUM(num_registered) AS HowMany
-- FROM names
-- WHERE gender = 'F'
-- GROUP BY name
-- ORDER BY SUM(num_registered) DESC
-- LIMIT 1


-- 8. What are the most popular male and female names overall (i.e., the most total registrations)?
-- SELECT name, gender, SUM(num_registered)
-- FROM names
-- GROUP BY name, gender
-- ORDER BY SUM(num_registered) DESC;

--Answer
-- Male: James
-- Female: Mary




-- 9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
-- SELECT name, gender, SUM(num_registered)
-- FROM names
-- WHERE year BETWEEN 2000 AND 2009
-- GROUP BY name, gender
-- ORDER BY SUM(num_registered) DESC;

--Answer
-- Male: Jacob
-- Female: Emily





-- 10. Which year had the most variety in names (i.e. had the most distinct names)?
-- SELECT COUNT(DISTINCT(name)), year
-- FROM names
-- GROUP BY year
-- ORDER BY COUNT DESC;

-- Answer
-- 2008





--11. What is the most popular name for a girl that starts with the letter X?
-- SELECT name, gender, MAX(num_registered)
-- FROM names
-- WHERE gender = 'F' AND name LIKE 'X%'
-- GROUP BY name, gender
-- ORDER BY MAX(num_registered) DESC;

--Answer
--Ximena





--12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?

-- SELECT name
-- FROM names
-- WHERE name LIKE 'Q%'
-- GROUP BY name
-- HAVING name NOT LIKE '_u%';

--Answer
--46




-- 13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.

-- SELECT name, COUNT(name)
-- FROM names
-- WHERE name = 'Stephen'
-- OR name = 'Steven'
-- GROUP BY name;

--Answer
--Stephen is the preferred spelling

-- MH ALternate HAVING
-- SELECT name, SUM(num_registered)
-- FROM names
-- GROUP BY name
-- HAVING name = 'Stephen' OR name = 'Steven'

-- SELECT name, SUM(num_registered)
-- FROM names
-- WHERE name LIKE 'Ste%en'
-- GROUP by name
-- ORDER BY SUM(num_registered) DESC;



-- 14. What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?

-- SELECT COUNT(DISTINCT name)
-- FROM names
-- WHERE gender = 'F'
-- OR gender = 'M';

-- SELECT COUNT(DISTINCT name)
-- FROM names
-- WHERE gender = 'M';

-- SELECT COUNT(DISTINCT name)
-- FROM names
-- WHERE gender = 'F';

-- Answer
-- (41475+67698)
--  -(98400)
-- Equals = 10773, or about 11%

-- WITH NameCounts AS (
--   SELECT name, COUNT(DISTINCT gender) AS GenderCount
--   FROM names
--   GROUP BY name
-- )

-- SELECT COUNT(*) AS UnisexNamesCount,
--        (COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT name) FROM NameCounts)) AS PercentageUnisex
-- FROM NameCounts
-- WHERE GenderCount = 2;

-- SELECT name, COUNT(DISTINCT gender)
-- FROM names
-- GROUP BY name
-- HAVING COUNT(DISTINCT gender) > 1



-- 15. How many names have made an appearance in every single year since 1880?
-- SELECT COUNT(name)
-- FROM names
-- GROUP BY name
-- HAVING count(distinct(year))=139

-- Answer
-- 1817

-- SELECT name
-- FROM names
-- GROUP BY name
-- HAVING count(distinct(year))=(SELECT(COUNT(DISTINCT(YEAR))) from name);
-- (THIS CODE DOESN"T WORK>>>REVIEW IN VID)


-- 16. How many names have only appeared in one year?
-- SELECT name 
-- FROM names
-- GROUP BY name
-- HAVING COUNT(DISTINCT Year)='1'

-- Answer
-- 21123
---( Messed with the code, and now it's wrong...)




-- 17. How many names only appeared in the 1950s?
SELECT name, COUNT(DISTINCT name)
FROM names
GROUP BY name
HAVING MIN(Year)<=1950 AND MAX(Year)>=1959;

-- Answer
-- The above didn't work.

-- WITH names_50s AS (
-- 	SELECT name, MIN(year) AS first_year, MAX(year) AS last_year
-- 	FROM names
-- 	GROUP BY 1
-- 	HAVING MIN(year) >= 1950 AND MAX(year) <= 1959
-- )

-- SELECT COUNT(*)
-- FROM names_50s;

-- How many names made their first appearance in the 2010s?
-- SELECT
-- FROM
-- WHERE