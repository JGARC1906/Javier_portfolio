# World Life Expectancy Project (Data Cleaning) 

SELECT * 
FROM world_life_expectancy.world_life_expectancy_2
;

SELECT Country, Year, CONCAT(Country, Year), COUNT(CONCAT(Country, Year))
FROM world_life_expectancy.world_life_expectancy_2
GROUP BY Country, Year, CONCAT(Country, Year)
HAVING COUNT(Concat(Country, year)) > 1 
; 

SELECT * 
FROM (
      SELECT Row_ID,
      CONCAT(Country,Year),
      ROW_NUMBER () OVER (PARTITION BY CONCAT(Country, Year)
      ORDER BY CONCAT(Country, Year)) as Row_num
      FROM world_life_expectancy.world_life_expectancy_2
      ) as Row_table 
WHERE Row_num > 1 
;

DELETE FROM world_life_expectancy.world_life_expectancy_2
WHERE 
     Row_ID IN (
     SELECT Row_ID
FROM (
      SELECT Row_ID,
      CONCAT(Country,Year),
      ROW_NUMBER () OVER (PARTITION BY CONCAT(Country, Year)
      ORDER BY CONCAT(Country, Year)) as Row_num
      FROM world_life_expectancy.world_life_expectancy_2
      ) as Row_table 
WHERE Row_num > 1
)
;

SELECT *
FROM world_life_expectancy.world_life_expectancy_2
WHERE Status = ''
;

SELECT DISTINCT (Status)
FROM world_life_expectancy.world_life_expectancy_2
WHERE Status <> ''
;

UPDATE world_life_expectancy.world_life_expectancy_2 t1
JOIN world_life_expectancy.world_life_expectancy_2 t2
	   ON t1.Country = t2.Country 
SET t1.Status = 'Developing'
WHERE t1.status = '' 
AND t2.Status <> '' 
AND t2.Status = 'Developing'
; 

SELECT * 
FROM world_life_expectancy.world_life_expectancy_2
WHERE Country = 'United States of America' 
;

UPDATE world_life_expectancy.world_life_expectancy_2 t1
JOIN world_life_expectancy.world_life_expectancy_2 t2
	   ON t1.Country = t2.Country 
SET t1.Status = 'Developed'
WHERE t1.status = '' 
AND t2.Status <> '' 
AND t2.Status = 'Developed'
; 

SELECT Country, Year, `Life Expectancy`
FROM world_life_expectancy.world_life_expectancy_2
;

SELECT *
FROM world_life_expectancy.world_life_expectancy_2
WHERE `Life Expectancy` = ''
;

SELECT t1. Country, t1. Year, t1. `Life Expectancy`,
t2.Country, t2.Year, t2.`Life Expectancy`,
t3.Country, t3.Year, t3.`Life Expectancy`,
ROUND((t2.`Life Expectancy` + t3. `Life Expectancy`)/2,1)
FROM world_life_expectancy.world_life_expectancy_2 t1 
JOIN world_life_expectancy.world_life_expectancy_2 t2
	ON t1.Country = t2.Country 
    AND t1.Year = t2.Year -1 
JOIN world_life_expectancy.world_life_expectancy_2 t3
	ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1 
WHERE t1. `Life Expectancy` = ''
; 

UPDATE world_life_expectancy.world_life_expectancy_2 t1
JOIN world_life_expectancy.world_life_expectancy_2 t2
	ON t1.Country = t2.Country 
    AND t1.Year = t2.Year -1 
JOIN world_life_expectancy.world_life_expectancy_2 t3
	ON t1.Country = t3.Country
    AND t1.Year = t3.Year + 1 
SET t1. `Life Expectancy` = ROUND((t2.`Life Expectancy` + t3. `Life Expectancy`)/2,1)
WHERE t1. `Life Expectancy` = ''
; 

SELECT * 
FROM world_life_expectancy.world_life_expectancy_2

# END OF THE PROJECT OF DATA CLEANING 













