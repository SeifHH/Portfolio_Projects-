/*
We will be performing Explatory Data Analysis on a FIFA 2018 DataSet. 

DateSet can be found here if further research/Exploration needs to be done. 

Data Source: https://public.tableau.com/en-us/s/resources


*/

-- Check our dataset. 

SELECT *

FROM 

Fifa18

--Check how many countries are represented

SELECT COUNT(DISTINCT Nationality)

FROM 

DBO.Fifa18


--Check the number of players in FIFA 

SELECT  
COUNT(*) as Number_of_Players
FROM
Fifa18

--How many players from each country. Check the top 5

SELECT TOP 5 COUNT(*) AS NumOfPlayer_FromEach_Country, 
Nationality

FROM Fifa18

GROUP BY nationality 
ORDER BY NumOfPlayer_FromEach_Country DESC


--England appears to have the most players in FIFA. 


--What's the highest Salary paid to a player 

SELECT 

MAX([Wage (€)]) AS Maximum_Salary 

FROM Fifa18


-- Which player is getting paid the highest and where is he from?

SELECT
Name, 
Nationality

FROM Fifa18

WHERE [Wage (€)] = 565000  --Interestingly, we have two players getting the highest salary. The two goats(CR7, and Messi)

--We can also do it this way. Nesting a query within a query(Outer query)

SELECT 
name, 
[Wage (€)]

FROM
Fifa18
WHERE [Wage (€)] = (SELECT max([Wage (€)]) FROM Fifa18)

---What's the minimum Salary paid?

SELECT 
min([Wage (€)])
FROM 
Fifa18

--It appears some people work in FIFA volunterly. 

--Which player is got the highest rating and from which club? USE THE NESTED QUERY METHOD FOR THIS.

SELECT 
NAME, 
OVERALL, 
CLUB
FROM 
Fifa18
WHERE OVERALL = (SELECT MAX(OVERALL) FROM Fifa18)     --My main man Critiano Ronaldo(CR7) Comes on top. 

--Which are top 3 clubs based on overall rating ?

SELECT 
TOP 5
AVG(overall) as Average_Overall_rating, 
CLUB
FROM
Fifa18
GROUP BY CLUB
ORDER BY Average_Overall_rating DESC

