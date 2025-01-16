# World Life Expectancy Project (Exploratory Data Analysis)

SELECT * 
FROM world_life_expectancy.world_life_expectancy_2
;

SELECT Country, MIN(`Life expectancy`), MAX(`life expectancy`)
FROM world_life_expectancy.world_life_expectancy_2
GROUP BY Country
ORDER BY Country DESC
;

SELECT Country,
MIN(`Life expectancy`),
MAX(`Life expectancy`),
ROUND(MAX(`Life Expectancy`) - MIN(`Life expectancy`),1) AS Life_Increase_15_years
FROM world_life_expectancy.world_life_expectancy_2
GROUP BY Country
HAVING MIN(`Life expectancy`) <> 0 
AND MAX(`Life expectancy`) <> 0 
ORDER BY Life_Increase_15_Years ASC 
; 

SELECT Year, ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy.world_life_expectancy_2
WHERE `Life expectancy` <> 0 
AND `Life expectancy` <> 0
GROUP BY Year
ORDER BY Year
; 

SELECT Country, ROUND(AVG(`Life expectancy`),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy.world_life_expectancy_2
GROUP BY Country
; 

SELECT Country, ROUND(AVG(`Life expectancy`),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy.world_life_expectancy_2
GROUP BY Country
HAVING Life_Exp > 0 
AND GDP > 0 
ORDER BY GDP DESC
;

SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) AS High_GDP_Count
FROM world_life_expectancy.world_life_expectancy_2
;

SELECT 
SUM( CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG( CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) High_GDP_Life_Expectancy,
SUM( CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) Low_GDP_Count, 
AVG( CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) low_GDP_Life_Expectancy
FROM world_life_expectancy.world_life_expectancy_2
;

SELECT Status, ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy.world_life_expectancy_2
GROUP BY Status
;

SELECT Status, COUNT(DISTINCT Country)
FROM world_life_expectancy.world_life_expectancy_2
GROUP BY Status
; 

SELECT Status, ROUND(AVG(`Life expectancy`),1), COUNT(DISTINCT Country)
FROM world_life_expectancy.world_life_expectancy_2
GROUP BY Status
;

SELECT Country, ROUND(AVG(`Life expectancy`),1) AS Life_Exp, ROUND(AVG(BMI),1) AS BMI
FROM world_life_expectancy.world_life_expectancy_2
GROUP BY Country
HAVING Life_Exp > 0
AND BMI > 0
ORDER BY BMI DESC 
; 

SELECT Country, 
Year, 
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy.world_life_expectancy_2
; 

































