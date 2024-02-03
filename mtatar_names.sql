-- SELECT * (toggle w/ ctrl /)
-- FROM names
-- LIMIT 5;

-- This is a comment

/*
SELECT *
FROM names
LIMIT 10;
*/

-- use myscript.sql to save
-- open the query tool
-- then use the folder to open the script






--Exercise Begins Here:

-- Save a script containing the query you used to answer each question and your answer (as a comment).

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
-- Linda in 1948 is the top answer



--4. What range of years are included?
-- SELECT MIN(year), MAX(year)
-- FROM names;

-- Answer
-- Min=1880 and Max=2018



--5. What year has the largest number of registrations?
-- SELECT year, SUM(num_registered)
-- FROM names
-- GROUP BY year
-- ORDER BY SUM(num_registered) DESC;

-- Answer
-- 1957 had 4200022



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
-- WHERE name LIKE 'Stephen'
-- OR name LIKE 'Steven'
-- GROUP BY name;

--Answer
--Stephen is the preferred spelling

-- 14. What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?

-- SELECT COUNT(DISTINCT name)
-- FROM names
-- WHERE gender = 'F'
-- OR gender = 'M';

-- SELECT COUNT(DISTINCT name)
-- FROM names
-- WHERE gender = 'M';

SELECT COUNT(DISTINCT name)
FROM names
WHERE gender = 'F';

-- (Question. How do I take the first equation, then add the second to the third, then subtract that from the first...)