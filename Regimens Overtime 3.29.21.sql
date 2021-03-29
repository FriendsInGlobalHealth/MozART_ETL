---- =========================================================================================================
---- Regimens Overtime SQL Query
---- Author: Marcela Torres
---- =========================================================================================================


WITH CTE as (

	SELECT DISTINCT 
	f.HdD, f.Provincia, f.Distrito, f.designacao,
	p.nid, p. AccessFilePath, p.sexo, p.datanasc,
	t.DatePickup, t.QuarterYear, t.codregime,t.DistType
	
	FROM
	(SELECT nid, sexo, cast(datanasc as date) as datanasc, hdd, codproveniencia, AccessFilePath
	FROM t_paciente) p

	LEFT JOIN
	(SELECT HdD, Provincia, Distrito, designacao, AccessFilePath
	FROM t_hdd) f
	ON p.hdd = f.HdD

	LEFT JOIN
	(SELECT AccessFilePath, nid, 
	CAST (datatarv as date) AS DatePickup,
	codregime,
	CAST (dataproxima as date) AS NextPickup,
	
	-- Adding column with quarter year for each drug pick up--
	CASE WHEN  month(datatarv) in (10,11,12) and year(datatarv) in (2018) then '119'
		WHEN  month(datatarv) in (10,11,12) and year(datatarv) in (2019) then '120'
		WHEN  month(datatarv) in (10,11,12) and year(datatarv) in (2020) then '121'
		WHEN  month(datatarv) in (10,11,12) and year(datatarv) in (2021) then '122'
		WHEN  month(datatarv) in (1,2,3) and year(datatarv) in (2018) then '218'
		WHEN  month(datatarv) in (1,2,3) and year(datatarv) in (2019) then '219'
		WHEN  month(datatarv) in (1,2,3) and year(datatarv) in (2020) then '220'
		WHEN  month(datatarv) in (1,2,3) and year(datatarv) in (2021) then '221'
		WHEN  month(datatarv) in (4,5,6) and year(datatarv) in (2018) then '318'
		WHEN  month(datatarv) in (4,5,6) and year(datatarv) in (2019) then '319'
		WHEN  month(datatarv) in (4,5,6) and year(datatarv) in (2020) then '320'
		WHEN  month(datatarv) in (4,5,6) and year(datatarv) in (2021) then '321'
		WHEN  month(datatarv) in (7,8,9) and year(datatarv) in (2018) then '418'
		WHEN  month(datatarv) in (7,8,9) and year(datatarv) in (2019) then '419'
		WHEN  month(datatarv) in (7,8,9) and year(datatarv) in (2020) then '420'
		WHEN  month(datatarv) in (7,8,9) and year(datatarv) in (2021) then '421'
	END as QuarterYear,

	--Calculating the type of pick up based on the next schedule pick up--
	datediff (day, datatarv, dataproxima) AS DaysDiff,

	CASE when datediff (day, datatarv, dataproxima) < = 35 then 1
		when datediff (day, datatarv, dataproxima) between 36 and 91 then 3
		when datediff (day, datatarv, dataproxima) between 92 and 180 then 6
		end as DistType
		
      FROM t_tarv) t
	  ON p.nid = t.nid AND p.AccessFilePath = t.AccessFilePath
      WHERE DatePickup > CAST('2018-01-01 00:00:00.000' as datetime)
          )

--- Selecting last pick up from each quarter

SELECT x.HdD, x.Provincia, x.Distrito, x.designacao, x.sexo, x.AgeBandLastPickUpQuarter, x.QuarterYear, x.codregime, x.DistType, count (distinct x.nid) as patients
--INTO Sandbox.dbo.RegimensOverTime
FROM
	(SELECT c.AccessFilePath, c.HdD, c.Provincia, c.Distrito, c.designacao, 
	f. nid, c.sexo, c.datanasc, f.LastPickUpQuarter, f.QuarterYear, c.codregime, c.DistType,
	datediff (year, datanasc, LastPickupQuarter) AS IdadeLastPickUpQuarter,
	CASE WHEN datediff (year, datanasc, LastPickupQuarter) BETWEEN  0 AND 4 THEN '0-4'
		WHEN datediff (year, datanasc, LastPickupQuarter)  BETWEEN  5 AND 9 THEN '5-9'
		WHEN datediff (year, datanasc, LastPickupQuarter)  BETWEEN  10 AND 14 THEN '10-14'
		WHEN datediff (year, datanasc, LastPickupQuarter)  BETWEEN  15 AND 19 THEN '15-19'
		WHEN datediff (year, datanasc, LastPickupQuarter)  BETWEEN  20 AND 24 THEN '20-24'
		WHEN datediff (year, datanasc, LastPickupQuarter)  BETWEEN  25 AND 29 THEN '25-29'
		WHEN datediff (year, datanasc, LastPickupQuarter)  BETWEEN  30 AND 34 THEN '30-34'
		WHEN datediff (year, datanasc, LastPickupQuarter)  BETWEEN  35 AND 39 THEN '35-39'
		WHEN datediff (year, datanasc, LastPickupQuarter)  BETWEEN  40 AND 44 THEN '40-44'
		WHEN datediff (year, datanasc, LastPickupQuarter)  BETWEEN  45 AND 49 THEN '45-49'
		WHEN datediff (year, datanasc, LastPickupQuarter)  >50 THEN '50+'
	END AS AgeBandLastPickUpQuarter
	FROM
	((SELECT nid, MAX (DatePickup) LastPickUpQuarter, QuarterYear
	FROM CTE
	GROUP BY QuarterYear, nid) f
	
	LEFT JOIN
	CTE c
	ON f.nid=c.nid AND f.LastPickUpQuarter=c.DatePickup)) x
	
GROUP BY x.HdD, x.Provincia, x.Distrito, x.designacao, x.sexo, x.AgeBandLastPickUpQuarter, x.QuarterYear, x.codregime, x.DistType




----------------------------------------------------------------------
-----Code Checks------------------------------------------------------
SELECT *
FROM t_tarv
WHERE nid = '0100401501201700147376'

SELECT *
FROM t_tarv
WHERE nid = '01100415012016002481285'

---Only drug pick ups > 1/1/2018 correct (23 drug pick ups)
SELECT *
FROM Sandbox.dbo.RegimensOvertime
WHERE nid = '01100415012016002481285'

---Only the max drug pick up selected for each quarter correct (8 drug pick ups)
SELECT nid, QuarterYear,
MAX (DatePickup)
FROM Sandbox.dbo.RegimensOvertime
WHERE nid = '01100415012016002481285'
GROUP BY QuarterYear, nid


-----------------------------------------------------------------------
-------------Need to add viral load information to the regimen query---
--- TODO: Join Viral Load code with the Regimen code and select Vl results for patients who have been
--- in a single regimen for the 6 months previous to the VL result

WITH CTE as (

	SELECT DISTINCT 
	p. AccessFilePath, p.nid, p.sexo, p.datanasc,
	r.codexame, r.dataresultado, r.QuarterYearVL, r.resultado
	
	FROM
	(SELECT nid, sexo, cast(datanasc as date) as datanasc, hdd, codproveniencia, AccessFilePath
	FROM t_paciente) p

	LEFT JOIN
	(SELECT AccessFilePath, nid, 
	CAST (dataresultado as date) AS dataresultado,
	codexame,
	resultado,
	
	-- Adding column with quarter year for each VL test--
	CASE WHEN  month(dataresultado) in (10,11,12) and year(dataresultado) in (2018) then '119'
		WHEN  month(dataresultado) in (10,11,12) and year(dataresultado) in (2019) then '120'
		WHEN  month(dataresultado) in (10,11,12) and year(dataresultado) in (2020) then '121'
		WHEN  month(dataresultado) in (10,11,12) and year(dataresultado) in (2021) then '122'
		WHEN  month(dataresultado) in (1,2,3) and year(dataresultado) in (2018) then '218'
		WHEN  month(dataresultado) in (1,2,3) and year(dataresultado) in (2019) then '219'
		WHEN  month(dataresultado) in (1,2,3) and year(dataresultado) in (2020) then '220'
		WHEN  month(dataresultado) in (1,2,3) and year(dataresultado) in (2021) then '221'
		WHEN  month(dataresultado) in (4,5,6) and year(dataresultado) in (2018) then '318'
		WHEN  month(dataresultado) in (4,5,6) and year(dataresultado) in (2019) then '319'
		WHEN  month(dataresultado) in (4,5,6) and year(dataresultado) in (2020) then '320'
		WHEN  month(dataresultado) in (4,5,6) and year(dataresultado) in (2021) then '321'
		WHEN  month(dataresultado) in (7,8,9) and year(dataresultado) in (2018) then '418'
		WHEN  month(dataresultado) in (7,8,9) and year(dataresultado) in (2019) then '419'
		WHEN  month(dataresultado) in (7,8,9) and year(dataresultado) in (2020) then '420'
		WHEN  month(dataresultado) in (7,8,9) and year(dataresultado) in (2021) then '421'
	END as QuarterYearVL
		
      FROM t_resultadoslaboratorio) r
	  ON p.nid = r.nid AND p.AccessFilePath = r.AccessFilePath
      WHERE dataresultado > CAST('2018-01-01 00:00:00.000' as datetime) and codexame='Carga Viral' and p.nid = '01100415012015000111006'
          )

--- Selecting last VL each quarter

SELECT x.AccessFilePath, x.nid, x.sexo, x.datanasc, x.dataresultado, x.codexame, x.QuarterYearVL, x.resultado
--INTO Sandbox.dbo.RegimensOverTime
FROM
	(SELECT c. AccessFilePath, f.nid, c.sexo, c.datanasc, c.dataresultado, c.codexame, f.QuarterYearVL, c.resultado
	FROM
	((SELECT nid, MAX (dataresultado) LastVLQuarter, QuarterYearVL
	FROM CTE
	GROUP BY QuarterYearVL, nid) f
	
	LEFT JOIN
	CTE c
	ON f.nid=c.nid AND f.LastVLQuarter=c.dataresultado)) x
	
GROUP BY x.AccessFilePath, x.nid, x.sexo, x.datanasc, x.dataresultado, x.codexame, x.QuarterYearVL, x.resultado


-----Code Checks------------------------------------------------------
SELECT *
FROM t_resultadoslaboratorio
WHERE nid = '01100415012015000111006'

SELECT *
FROM t_paciente
WHERE nid = '01100415012015000111006'

SELECT *
FROM t_resultadoslaboratorio
WHERE nid = '0110040701201402162681'

SELECT *
FROM t_paciente
WHERE nid = '0110040701201402162681'

